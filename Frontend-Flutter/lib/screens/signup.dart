import 'package:dieases_prediction/cubits/signup/signup_cubit.dart';
import 'package:dieases_prediction/cubits/signup/signup_state.dart';
import 'package:dieases_prediction/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:video_player/video_player.dart';
import 'package:dieases_prediction/commonWidgets.dart';
import "package:dieases_prediction/globalVariables.dart";
// import 'package:http/http.dart' as http;

class signup extends StatefulWidget {
  const signup({super.key});

  @override
  State<signup> createState() => _signupState();
}

class _signupState extends State<signup> {
  TextEditingController email = TextEditingController();
  TextEditingController pwd = TextEditingController();
  TextEditingController uname = TextEditingController();
  VideoPlayerController? controller;
  @override
  void initState() {
    super.initState();
    fun();
    controller = VideoPlayerController.asset("assets/videos/corona.mp4");
    controller!.initialize().then((_) {
      controller!.play();
      controller!.setLooping(true);
      setState(() {
        print(1);
      });
    });
  }

  void fun() async {
    var r = await globalVariables.chechTokenPresence(context);
    if (r == 1) {
      await Navigator.popAndPushNamed(context, routes.selectDisease);
    }
  }

  commonWidgets c = commonWidgets();
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width,
        h = MediaQuery.of(context).size.height;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(children: [
        SizedBox.expand(
          child: FittedBox(
            alignment: Alignment.center,
            fit: BoxFit.cover,
            child: SizedBox(
              height: controller!.value.size.height,
              width: controller!.value.size.width,
              child: VideoPlayer(
                controller!,
              ),
            ),
          ),
        ),
        Container(
            width: w,
            height: h,
            color: const Color.fromARGB(120, 173, 181, 189),
            child: Column(
                // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    margin: EdgeInsets.only(top: (h / 100) * 10),
                    child: c.myInputField(
                        w * 0.9,
                        w,
                        "email",
                        "abc@gmail.com",
                        email,
                        Icon(Icons.person_2_outlined,
                            color: const Color.fromARGB(255, 233, 236, 239),
                            size: (w / 100) * 7)),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: (h / 100) * 7),
                    child: c.myInputField(
                        w * 0.9,
                        w,
                        "password",
                        "123456",
                        pwd,
                        Icon(Icons.password_outlined,
                            color: const Color.fromARGB(255, 233, 236, 239),
                            size: (w / 100) * 7)),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: (h / 100) * 7),
                    child: c.myInputField(
                        w * 0.9,
                        w,
                        "Username",
                        "uname",
                        uname,
                        Icon(Icons.person_2_outlined,
                            color: const Color.fromARGB(255, 233, 236, 239),
                            size: (w / 100) * 7)),
                  ),
                  Container(
                    margin:
                        EdgeInsets.only(top: (h / 100) * 7, right: w * 0.05),
                    child: BlocProvider(
                      create: (context) => signupCubit(),
                      child: BlocBuilder<signupCubit, signupState>(
                          builder: (context, state) {
                        if (state is signupStateFilling) {
                          return InkWell(
                            onTap: () {
                              context
                                  .read<signupCubit>()
                                  .submitted(email.text, pwd.text, uname.text);
                            },
                            child: Align(
                              alignment: Alignment.bottomRight,
                              child: Container(
                                alignment: Alignment.center,
                                width: w * 0.4,
                                padding: const EdgeInsets.all(6),
                                decoration: BoxDecoration(
                                    color: const Color.fromARGB(
                                        255, 206, 212, 218),
                                    borderRadius: BorderRadius.circular(10)),
                                child: Text(
                                  "Signup",
                                  style: GoogleFonts.getFont("Gowun Dodum")
                                      .copyWith(
                                          color: const Color.fromARGB(
                                              255, 33, 37, 41),
                                          fontSize: (w / 100) * 7,
                                          fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          );
                        } else {
                          if (state is signupStateSubmitted) {
                            getResult(state);
                            context.read<signupCubit>().wrongCredentials();
                          }
                          return Container(
                              padding: const EdgeInsets.all(10),
                              width: (w / 100) * 15,
                              height: (h / 100) * 6,
                              color: const Color.fromARGB(255, 33, 37, 41),
                              child: const CircularProgressIndicator(
                                  color: Color.fromARGB(255, 206, 212, 218)));
                        }
                      }),
                    ),
                  )
                ])),
        // Positioned(
        //     bottom: (w / 100) * 8,
        //     child: InkWell(
        //         // splashColor: null,
        //         onTap: () {},
        //         child: Container(
        //           width: w,
        //           alignment: Alignment.center,
        //           child: Text.rich(
        //             TextSpan(
        //               text: "Doesn't have Account? ",
        //               style: GoogleFonts.getFont("Gowun Dodum").copyWith(
        //                   color: const Color.fromARGB(255, 33, 37, 41),
        //                   fontSize: (w / 100) * 5,
        //                   fontWeight: FontWeight.bold),
        //               children: <TextSpan>[
        //                 TextSpan(
        //                     text: 'SignUp',
        //                     style: GoogleFonts.getFont("Gowun Dodum").copyWith(
        //                         color: const Color.fromARGB(255, 33, 37, 41),
        //                         fontSize: (w / 100) * 5,
        //                         fontWeight: FontWeight.bold,
        //                         decoration: TextDecoration.underline)),
        //               ],
        //             ),
        //           ),
        //         )))
      ]),
    );
  }

  void getResult(state) async {
    var result = await state.ah.signup(state.email, state.pwd, state.uname);
    if (result) {
      await Navigator.pushReplacementNamed(context, routes.selectDisease);
      // await Navigator.popAndPushNamed(context, routes.selectDisease);
    } else {
      SnackBar s = SnackBar(
          backgroundColor: const Color.fromARGB(255, 206, 212, 218),
          content: Text(
              "Credentials are not Correct. Please check entered credentials",
              style: GoogleFonts.getFont("Gowun Dodum").copyWith(
                  color: const Color.fromARGB(255, 33, 37, 41), fontSize: 20)));
      ScaffoldMessenger.of(context).showSnackBar(s);
    }
  }

  // void chechTokenPresence() async {
  //   globalVariables.setToken().then((value) async {
  //     if (globalVariables.token != "") {
  //       await Navigator.popAndPushNamed(context, routes.selectDisease);
  //     }
  //   });
  // }
}
