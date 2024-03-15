import 'package:dieases_prediction/screens/diabetes.dart';
import 'package:dieases_prediction/screens/diseaseDescreption.dart';
import 'package:dieases_prediction/screens/heartDisease.dart';
import 'package:dieases_prediction/screens/login.dart';
import 'package:dieases_prediction/routes.dart';
import 'package:dieases_prediction/screens/outcome.dart';
import 'package:dieases_prediction/screens/parkinson.dart';
import 'package:dieases_prediction/screens/selectDisease.dart';
import 'package:dieases_prediction/screens/solution.dart';
import 'package:dieases_prediction/screens/userProfile.dart';
import 'package:dieases_prediction/screens/welcome.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: const welcome(),
        routes: {
          routes.login: (context) => const login(),
          routes.predictDiabetes: (context) => const diabetes(),
          routes.outcome: (context) =>
              outcome(diseaseName: "Diabetes", result: 0),
          routes.welcome: (context) => const welcome(),
          routes.selectDisease: (context) => const selectDisease(),
          routes.diseaseDescreption: (context) => const diseaseDescreption(),
          routes.solution: (context) => solution(disease: "Diabetes"),
          routes.userProfile: (context) => const userProfile(),
          routes.predictHeartDisease: (context) => const heartDisease(),
          routes.predictParkinson: (context) => const parkinson()
        });
  }
}

// import 'package:flutter/material.dart';
// import 'package:video_player/video_player.dart';

// void main() => runApp(const VideoApp());

// /// Stateful widget to fetch and then display video content.
// class VideoApp extends StatefulWidget {
//   const VideoApp({super.key});

//   @override
//   _VideoAppState createState() => _VideoAppState();
// }

// class _VideoAppState extends State<VideoApp> {
//   late VideoPlayerController _controller;

//   @override
//   void initState() {
//     super.initState();
//     _controller = VideoPlayerController.asset("assets/videos/corona.mp4")
//       ..initialize().then((_) {
//         // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
//         setState(() {});
//       });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Video Demo',
//       home: Scaffold(
//         body: Center(
//           child: _controller.value.isInitialized
//               ? AspectRatio(
//                   aspectRatio: _controller.value.aspectRatio,
//                   child: VideoPlayer(_controller),
//                 )
//               : Container(),
//         ),
//         floatingActionButton: FloatingActionButton(
//           onPressed: () {
//             setState(() {
//               _controller.value.isPlaying
//                   ? _controller.pause()
//                   : _controller.play();
//             });
//           },
//           child: Icon(
//             _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
//           ),
//         ),
//       ),
//     );
//   }

//   @override
//   void dispose() {
//     super.dispose();
//     _controller.dispose();
//   }
// }