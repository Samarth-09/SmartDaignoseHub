import 'package:dieases_prediction/cubits/signup/signup_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class signupCubit extends Cubit<signupState> {
  signupCubit() : super(signupStateFilling());
  void submitted(e, p, u) {
    emit(signupStateSubmitted(email: e, pwd: p, uname: u));
  }

  void wrongCredentials() {
    emit(signupStateFilling());
  }
}
