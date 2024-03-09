import 'package:dieases_prediction/Api/ApiHandler.dart';

class heartDiseaseState {}

class heartDiseaseStateSubmitted extends heartDiseaseState {
  List<num>? l;
  ApiHandler ah = ApiHandler();
  heartDiseaseStateSubmitted({this.l});
}

class heartDiseaseStateFilling extends heartDiseaseState {}
