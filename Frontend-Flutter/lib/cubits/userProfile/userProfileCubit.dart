import 'package:dieases_prediction/Api/ApiHandler.dart';
import 'package:dieases_prediction/Model/user.dart';
import 'package:dieases_prediction/cubits/userProfile/userProfileState.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class userProfileCubit extends Cubit<userProfileState> {
  userProfileCubit() : super(userProfileState()) {
    load();
  }

  void load() async {
    user u = await ApiHandler().getInfo();
    emit(userProfileLoaded(
        email: u.email, uname: u.uname, diseaseHistory: u.diseaseHistory));
  }
}
