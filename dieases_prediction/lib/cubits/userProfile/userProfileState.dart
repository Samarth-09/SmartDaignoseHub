class userProfileState {}

class userProfileInitalState extends userProfileState {}

class userProfileLoaded extends userProfileState {
  String uname = "";
  String email = "";
  List diseaseHistory = [];
  userProfileLoaded(
      {required this.uname, required this.email, required this.diseaseHistory});
}
