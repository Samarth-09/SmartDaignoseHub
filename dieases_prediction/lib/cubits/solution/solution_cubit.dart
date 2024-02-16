import 'package:dieases_prediction/cubits/solution/solution_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class solutionCubit extends Cubit<solutionnState> {
  solutionCubit() : super(solutionStateLoaded("Diabetes"));
  dynamic load(String disease) {
    emit(solutionStateLoaded(disease));
    return state;
  }
}
