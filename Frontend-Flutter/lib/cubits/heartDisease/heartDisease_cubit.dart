import 'package:dieases_prediction/cubits/heartDisease/heartDisease_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class heartDiseaseCubit extends Cubit<heartDiseaseState> {
  heartDiseaseCubit() : super(heartDiseaseStateFilling());
  void submitted(List<num> l) {
    emit(heartDiseaseStateSubmitted(l: l));
  }
}
