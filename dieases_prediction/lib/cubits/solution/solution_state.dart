class solutionnState {}

class solutionStateLoaded extends solutionnState {
  List<String> textSol = [];
  List<String> dietCharts = [];
  solutionStateLoaded(String disease){
    if (disease == "Diabetes") {
      textSol.add(
          "Carbohydrates:- Choose complex carbohydrates with a low glycemic index, such as whole grains (brown rice, quinoa, whole wheat), legumes, and vegetables. Monitor portion sizes to help control blood sugar levels.");
      textSol.add(
          "Proteins:- Include lean protein sources, such as poultry, fish, tofu, legumes, and low-fat dairy. Limit red meat and processed meats.");
      textSol.add(
          "Fats:- Choose healthy fats, including avocados, nuts, seeds, and olive oil. Limit saturated and trans fats found in fried foods, fatty meats, and processed snacks.");
      textSol.add(
          "Dairy or Dairy Alternatives:- Choose low-fat or fat-free options for dairy products.Consider alternatives like almond milk, soy milk, or other fortified non-dairy options.");
      textSol.add(
          "Snacks:- Opt for healthy snacks, such as raw vegetables with hummus, a handful of nuts, or Greek yogurt. Meal Timing:");
      textSol.add(
          "Meal Timing:- Aim for consistent meal times to help regulate blood sugar levels. Consider spacing meals throughout the day to prevent large spikes in blood sugar.");
      textSol.add(
          "Hydration:- Drink plenty of water throughout the day. Limit sugary drinks and choose water, herbal teas, or unsweetened beverages.");
      textSol.add(
          "Limit Sugary Foods:- Minimize the intake of sugary snacks, desserts, and sweetened beverages.");
      textSol.add(
          "Monitor Blood Sugar Levels: Regularly monitor blood sugar levels as advised by healthcare professionals. Adjust diet and medication based on blood sugar readings.");
    } else if (disease == "Heart Disease") {
      
    } else if (disease == "Parkinson") {}
  }
}
//   factory solutionStateLoaded.withData(String disease) {
//     solutionStateLoaded s = solutionStateLoaded();
//     if (disease == "Diabetes") {
//       print(2);
//       s.textSol.add(
//           "Carbohydrates:- Choose complex carbohydrates with a low glycemic index, such as whole grains (brown rice, quinoa, whole wheat), legumes, and vegetables. Monitor portion sizes to help control blood sugar levels.");
//       s.textSol.add(
//           "Proteins:- Include lean protein sources, such as poultry, fish, tofu, legumes, and low-fat dairy. Limit red meat and processed meats.");
//       s.textSol.add(
//           "Fats:- Choose healthy fats, including avocados, nuts, seeds, and olive oil. Limit saturated and trans fats found in fried foods, fatty meats, and processed snacks.");
//       s.textSol.add(
//           "Dairy or Dairy Alternatives:- Choose low-fat or fat-free options for dairy products.Consider alternatives like almond milk, soy milk, or other fortified non-dairy options.");
//       s.textSol.add(
//           "Snacks:- Opt for healthy snacks, such as raw vegetables with hummus, a handful of nuts, or Greek yogurt. Meal Timing:");
//       s.textSol.add(
//           "Meal Timing:- Aim for consistent meal times to help regulate blood sugar levels. Consider spacing meals throughout the day to prevent large spikes in blood sugar.");
//       s.textSol.add(
//           "Hydration:- Drink plenty of water throughout the day. Limit sugary drinks and choose water, herbal teas, or unsweetened beverages.");
//       s.textSol.add(
//           "Limit Sugary Foods:- Minimize the intake of sugary snacks, desserts, and sweetened beverages.");
//       s.textSol.add(
//           "Monitor Blood Sugar Levels: Regularly monitor blood sugar levels as advised by healthcare professionals. Adjust diet and medication based on blood sugar readings.");
//     } else if (disease == "Heart Disease") {
//     } else if (disease == "Parkinson") {}
//     return s;
//   }
// }
