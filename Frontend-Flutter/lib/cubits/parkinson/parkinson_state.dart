import 'package:dieases_prediction/Api/ApiHandler.dart';

class parkinsonState {}

class parkinsonStateSubmitted extends parkinsonState {
  List<num>? l;
  ApiHandler ah = ApiHandler();
  parkinsonStateSubmitted({this.l});
}

class parkinsonStateFilling extends parkinsonState {}
