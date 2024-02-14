class outcomeState {}

class outcomeStateInitial extends outcomeState {}

class outcomeStateLoaded extends outcomeState {
  String title = "";
  String titleText = "";
  String bodyText = "";
  int outcome = 0;
  List<String> videoLinks = [];
  outcomeStateLoaded(
      {required this.title,
      required this.titleText,
      required this.bodyText,
      required this.outcome,
      required this.videoLinks});
}
