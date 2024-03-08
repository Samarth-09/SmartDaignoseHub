import 'package:dieases_prediction/cubits/login/login_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// class login_cubit extends Cubit<login_state_filling>
// {
//   login_cubit() : super(login_state_filling(email: '', pwd: ''));

//   void fill_email(String e){
//     emit(login_state_filling(email: e));
//   }
//   void fill_password(String p){
//     emit(login_state_filling(pwd: p));
//   }
//   void filled()
//   {
//     emit(login_state_filling());
//   }
// }

class loginCubit extends Cubit<loginState>
{
  loginCubit() : super(loginStateFilling());
  void submitted(e, p){
    emit(loginStateSubmitted(email: e, pwd: p));
  }

  void wrongCredentials()
  {
    emit(loginStateFilling());
  }
}