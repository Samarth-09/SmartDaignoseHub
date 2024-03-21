import 'package:dieases_prediction/cubits/diseaseDetailDescription/detailDescription_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class detailDescriptionCubit extends Cubit<detailDescriptionState> {
  detailDescriptionCubit(String name) : super(detailDescriptionLoadedState(name));
}
