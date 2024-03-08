import 'package:dieases_prediction/Model/disease.dart';

class user {
  String uname = "";
  String email = "";
  List<disease> diseaseHistory = [];
  String? feedBack;
  int? rating;
  user(
      {required this.uname,
      required this.email,
      required this.diseaseHistory,
      this.feedBack,
      this.rating});
}
