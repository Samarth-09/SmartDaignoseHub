import 'package:dieases_prediction/Api/ApiHandler.dart';

class signupState{}

class signupStateFilling extends signupState{}

class signupStateSubmitted extends signupState{
  String? email;
  String? pwd;
  String? uname;
  ApiHandler ah = ApiHandler();
  signupStateSubmitted({this.email, this.pwd, this.uname});
}

