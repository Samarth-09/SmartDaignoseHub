import 'package:dieases_prediction/cubits/parkinson/parkinson_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class parkinsonCubit extends Cubit<parkinsonState> {
  parkinsonCubit() : super(parkinsonStateFilling());
  void submitted(List<num> l) {
    emit(parkinsonStateSubmitted(l: l));
  }
}
