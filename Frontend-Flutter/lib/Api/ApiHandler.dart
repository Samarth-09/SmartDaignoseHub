import "package:dieases_prediction/Model/disease.dart";
import "package:dieases_prediction/Model/user.dart";
import "package:dieases_prediction/globalVariables.dart";
import "package:dio/dio.dart";

class ApiHandler {
  // String baseUrl = "https://smartdaignosehub-1.onrender.com";
  // String baseUrl = "http://192.168.1.10:3001";
  String baseUrl = "http://localhost:3001";
  Future<int> predictDiabetes(l) async {
    var res = await Dio()
        .post("$baseUrl/predict/diabetes",
            data: {"values": l},
            options: Options(
                headers: (globalVariables.token != "")
                    ? {"authorization": "Bearer ${globalVariables.token}"}
                    : null))
        .timeout(Duration(minutes: 1));
    return res.data['outcome'];
  }

  Future<int> predictHeartDisease(l) async {
    var res = await Dio()
        .post("$baseUrl/predict/heartDieases",
            data: {"values": l},
            options: Options(
                headers: (globalVariables.token != "")
                    ? {"authorization": "Bearer ${globalVariables.token}"}
                    : null))
        .timeout(Duration(minutes: 1));
    return res.data['outcome'];
  }

  Future<int> predictParkinson(l) async {
    var res = await Dio()
        .post("$baseUrl/predict/parkinson",
            data: {"values": l},
            options: Options(
                headers: (globalVariables.token != "")
                    ? {"authorization": "Bearer ${globalVariables.token}"}
                    : null))
        .timeout(Duration(minutes: 1));
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

  Future<user> getInfo() async {
    var res = await Dio().get("$baseUrl/user/info",
        options: Options(
            headers: (globalVariables.token != "")
                ? {"authorization": "Bearer ${globalVariables.token}"}
                : null));
    // print(res.data['dieseasesHistory']['dateOfCheck']);
    List<disease> l = List.generate(res.data['dieseasesHistory'].length,
        (index) => disease.fromJson(res.data['dieseasesHistory'][index]));
    // print(l);
    l.sort((a, b) => -a.date.compareTo(b.date));
    return user(
        uname: res.data['uname'], email: res.data['email'], diseaseHistory: l);
  }
}
