// class login_state_filling{
//   String? email;
//   String? pwd;
//   login_state_filling({this.email, this.pwd});
// }


import 'package:dieases_prediction/Api/ApiHandler.dart';

abstract class loginState{}

class loginStateFilling extends loginState{}

class loginStateSubmitted extends loginState{
  final String? email;
  final String? pwd;
  ApiHandler ah = new ApiHandler();
  loginStateSubmitted({this.email, this.pwd});
}


