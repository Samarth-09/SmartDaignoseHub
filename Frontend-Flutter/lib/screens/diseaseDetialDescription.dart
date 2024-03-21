import 'package:dieases_prediction/cubits/diseaseDetailDescription/detailDescription_cubit.dart';
import 'package:dieases_prediction/cubits/diseaseDetailDescription/detailDescription_state.dart';
import 'package:flutter/material.dart';
import 'package:dieases_prediction/commonWidgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dieases_prediction/globalVariables.dart';
// ignore: must_be_immutable
class diseaseDetailDescription extends StatefulWidget {
  String disease = "";
  diseaseDetailDescription({super.key, required this.disease});
  @override
  State<diseaseDetailDescription> createState() =>
      _diseaseDetailDescriptionState(disease);
}

class _diseaseDetailDescriptionState extends State<diseaseDetailDescription> {
  String disease = "";
  _diseaseDetailDescriptionState(this.disease);
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width,
        h = MediaQuery.of(context).size.height;
    return Scaffold(
        appBar: commonWidgets.appBar(w),
        drawer: commonWidgets.drawer(w, h),
        body: Container(
          padding: const EdgeInsets.all(10),
          alignment: Alignment.center,
          width: w,
          height: h,
          color: globalVariables.dark1,
            child: BlocProvider(
                create: (context) => detailDescriptionCubit(disease),
                child:
                    BlocBuilder<detailDescriptionCubit, detailDescriptionState>(
                        builder: (context, state) {
                  if (state is detailDescriptionLoadedState) {
                    return ListView.builder(
                      itemCount: state.graphs.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          margin: EdgeInsets.only(bottom: (h / 100) * 3),
                          child: ClipRRect(
                              clipBehavior: Clip.antiAlias,
                              borderRadius: BorderRadius.circular(10),
                              child: Image.asset(
                                state.graphs[index],
                                width: w * 0.9,
                                height: h * 0.4,
                                fit: BoxFit.fill,
                              )),
                        );
                      },
                    );
                  } else {
                    return Container();
                  }
                }))));
  }
}
