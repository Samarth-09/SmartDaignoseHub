import 'package:dieases_prediction/cubits/outcome/outcome_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class outcomeCubit extends Cubit<outcomeState> {
  outcomeCubit() : super(outcomeStateInitial());

  void load(title, titleText, bodyText, outcome, videoLinks) {
    emit(outcomeStateLoaded(
        title: title,
        titleText: titleText,
        bodyText: bodyText,
        outcome: outcome,
        videoLinks: videoLinks));
  }
}
