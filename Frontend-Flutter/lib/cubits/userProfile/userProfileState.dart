class userProfileState {}

class userProfileInitalState extends userProfileState {}

class userProfileLoaded extends userProfileState {
  String uname = "";
  String email = "";
  List diseaseHistory = [];
  Map<String, int> mp = {};
  userProfileLoaded(
      {required this.uname, required this.email, required this.diseaseHistory});
}
