import 'package:dieases_prediction/cubits/diabetes/diabetes_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class diabetesCubit extends Cubit<diabetesState> {
  diabetesCubit() : super(diabetesStateFilling());
  void submitted(List<num> l) {
    emit(diabetesStateSubmitted(l: l));
  }
}
