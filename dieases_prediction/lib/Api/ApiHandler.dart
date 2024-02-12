import "package:dieases_prediction/globalVariables.dart";
import "package:dio/dio.dart";

class ApiHandler {
  String baseUrl = "http://localhost:3000";
  Future<int> predictDiabetes(l) async {
    var res = await Dio().post("$baseUrl/predict/diabetes",
        data: {"values": l},
        options: Options(
            headers: (globalVariables.token != "")
                ? {"authorization": "Bearer ${globalVariables.token}"}
                : null));
    return res.data['outcome'];
  }

  Future<bool> login(email, pwd) async {
    var res = await Dio().get("$baseUrl/user/login",
        queryParameters: {"email": email, "pwd": pwd},
        options: Options(
            headers: (globalVariables.token != "")
                ? {"authorization": "Bearer ${globalVariables.token}"}
                : null));
    if (res.data['msg'] is String) {
      globalVariables.storeToken(res.data['msg']);
      print(res.data['msg']);
      return true;
    } else {
      return res.data['msg'];
    }
  }
}
