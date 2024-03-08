class solutionnState {}

class solutionStateLoaded extends solutionnState {
  List<String> textSol = [];
  List<String> dietCharts = [];
  solutionStateLoaded(String disease) {
    if (disease == "Diabetes") {
      dietCharts.add(
          "Carbohydrates:- Choose complex carbohydrates with a low glycemic index, such as whole grains (brown rice, quinoa, whole wheat), legumes, and vegetables. Monitor portion sizes to help control blood sugar levels.");
      dietCharts.add(
          "Proteins:- Include lean protein sources, such as poultry, fish, tofu, legumes, and low-fat dairy. Limit red meat and processed meats.");
      dietCharts.add(
          "Fats:- Choose healthy fats, including avocados, nuts, seeds, and olive oil. Limit saturated and trans fats found in fried foods, fatty meats, and processed snacks.");
      dietCharts.add(
          "Dairy or Dairy Alternatives:- Choose low-fat or fat-free options for dairy products.Consider alternatives like almond milk, soy milk, or other fortified non-dairy options.");
      dietCharts.add(
          "Snacks:- Opt for healthy snacks, such as raw vegetables with hummus, a handful of nuts, or Greek yogurt. Meal Timing:");
      dietCharts.add(
          "Meal Timing:- Aim for consistent meal times to help regulate blood sugar levels. Consider spacing meals throughout the day to prevent large spikes in blood sugar.");
      dietCharts.add(
          "Hydration:- Drink plenty of water throughout the day. Limit sugary drinks and choose water, herbal teas, or unsweetened beverages.");
      dietCharts.add(
          "Limit Sugary Foods:- Minimize the intake of sugary snacks, desserts, and sweetened beverages.");
      dietCharts.add(
          "Monitor Blood Sugar Levels: Regularly monitor blood sugar levels as advised by healthcare professionals. Adjust diet and medication based on blood sugar readings.");

      textSol.add(
          "Healthy Eating: Follow a balanced diet with a focus on whole foods, including fruits, vegetables, whole grains, lean proteins, and healthy fats.Monitor portion sizes and be mindful of carbohydrate intake.");
      textSol.add(
          "Regular Physical Activity: Engage in regular exercise to help manage blood sugar levels and improve overall health. Aim for at least 150 minutes of moderate-intensity aerobic exercise per week.");
      textSol.add(
          "Weight Management: Achieve and maintain a healthy weight. Losing excess weight can have a positive impact on blood sugar control.Limit Processed Foods and Sugars: Minimize the intake of processed and sugary foods. Be cautious with added sugars and refined carbohydrates.");
      textSol.add(" Stay Hydrate Drink plenty of water throughout the day.");
      textSol.add(
          "Quit Smoking: If you smoke, seek support to quit. Smoking can contribute to complications associated with diabetes.");
      textSol.add(
          "Limit Alcohol Intake: If you choose to drink alcohol, do so in moderation. Alcohol can affect blood sugar levels.");
      textSol.add(
          "Take Medications as Prescribed: If prescribed medication, take it as directed by your healthcare provider.");
      textSol.add(
          "egular Blood Sugar Monitoring: Monitor blood sugar levels regularly, as advised by your healthcare team. keep track of your readings and share them with your healthcare provider. Precautions and Warning Signs: Regular Health Check-ups: Schedule regular check-ups with your healthcare provider to monitor overall health and assess diabetes management.");
      textSol.add(
          "Know the Signs of Hypoglycemia: Learn the symptoms of low blood sugar (hypoglycemia) and how to treat it promptly. Foot Care: Inspect your feet daily for any cuts, sores, or changes. Seek prompt medical attention for any foot-related concerns.E ye Exams: Schedule regular eye exams to monitor for diabetes-related eye complications. Manage Stress:");
    } else if (disease == "Heart Disease") {
    } else if (disease == "Parkinson") {}
  }
}
// Lifestyle and Dietary Measures:
// Healthy Eating:

// Follow a balanced diet with a focus on whole foods, including fruits, vegetables, whole grains, lean proteins, and healthy fats.
// Monitor portion sizes and be mindful of carbohydrate intake.
// Regular Physical Activity:

// Engage in regular exercise to help manage blood sugar levels and improve overall health.
// Aim for at least 150 minutes of moderate-intensity aerobic exercise per week.
// Weight Management:

// Achieve and maintain a healthy weight. Losing excess weight can have a positive impact on blood sugar control.
// Limit Processed Foods and Sugars:

// Minimize the intake of processed and sugary foods.
// Be cautious with added sugars and refined carbohydrates.
// Stay Hydrated:

// Drink plenty of water throughout the day.
// Quit Smoking:

// If you smoke, seek support to quit. Smoking can contribute to complications associated with diabetes.
// Limit Alcohol Intake:

// If you choose to drink alcohol, do so in moderation. Alcohol can affect blood sugar levels.
// Medication and Monitoring:
// Take Medications as Prescribed:

// If prescribed medication, take it as directed by your healthcare provider.
// Regular Blood Sugar Monitoring:

// Monitor blood sugar levels regularly, as advised by your healthcare team.
// Keep track of your readings and share them with your healthcare provider.
// Precautions and Warning Signs:
// Regular Health Check-ups:

// Schedule regular check-ups with your healthcare provider to monitor overall health and assess diabetes management.
// Know the Signs of Hypoglycemia:

// Learn the symptoms of low blood sugar (hypoglycemia) and how to treat it promptly.
// Foot Care:

// Inspect your feet daily for any cuts, sores, or changes.
// Seek prompt medical attention for any foot-related concerns.
// Eye Exams:

// Schedule regular eye exams to monitor for diabetes-related eye complications.
// Manage Stress:

// Practice stress-reducing techniques, as stress can impact blood sugar levels.
// Know the Signs of Hyperglycemia:

// Recognize the symptoms of high blood sugar (hyperglycemia) and take appropriate action.
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
