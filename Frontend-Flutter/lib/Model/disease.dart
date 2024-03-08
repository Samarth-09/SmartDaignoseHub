class disease {
  String name = "";
  String date = "";
  List<dynamic> values = [];
  bool? outcome;
  disease(
      {required this.date,
      required this.name,
      required this.values,
      this.outcome});
  factory disease.fromJson(data) {
    return disease(
        date: data['dateOfCheck'],
        name: data['name'],
        values: data['reportValues'],//.forEach((e) => double.parse(e)),
        outcome: data['output']);
  }
}
