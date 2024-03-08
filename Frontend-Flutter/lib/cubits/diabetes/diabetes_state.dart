import 'package:dieases_prediction/Api/ApiHandler.dart';

class diabetesState {}

class diabetesStateSubmitted extends diabetesState {
  List<num>? l;
  ApiHandler ah = ApiHandler();
  diabetesStateSubmitted({this.l});
}

class diabetesStateFilling extends diabetesState {}
