class detailDescriptionState {}

class detailDescriptionLoadedState extends detailDescriptionState {
  List<String> graphs = [];
  String description = "";
  detailDescriptionLoadedState(String diseaseName) {
    if (diseaseName == "Diabetes") {
      for (int i = 1; i <= 10; i++) {
        graphs.add("images/Diabetis_Analysis/img$i.png");
      }
    } else if (diseaseName == "Heart Disease") {
      for (int i = 1; i <= 14; i++) {
        graphs.add("images/Heart_Analysis/img$i.png");
      }
      graphs.add("images/Heart_Analysis/Cholestrol.png");
      graphs.add("images/Heart_Analysis/correlation.png");
      graphs.add("images/Heart_Analysis/max_pulse_rate.png");
    } else {
      for (int i = 1; i <= 4; i++) {
        graphs.add("images/Parkinson_Analysis/img$i.png");
      }
    }
  }
}
