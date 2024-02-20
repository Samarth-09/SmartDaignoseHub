import 'package:dieases_prediction/cubits/login/login_cubit.dart';
import 'package:dieases_prediction/cubits/login/login_state.dart';
import 'package:dieases_prediction/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:video_player/video_player.dart';
import 'package:dieases_prediction/widgets.dart';
import "package:dieases_prediction/globalVariables.dart";
// import 'package:http/http.dart' as http;

class login extends StatefulWidget {
  const login({super.key});

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  TextEditingController email = TextEditingController();
  TextEditingController pwd = TextEditingController();
  VideoPlayerController? controller;
  void initState() {
    super.initState();
    chechTokenPresence();
    controller = VideoPlayerController.asset("assets/videos/corona.mp4");
    controller!.initialize().then((_) {
      controller!.play();
      controller!.setLooping(true);
      setState(() {
        print(1);
      });
    });
  }

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
                    child: widgets.myInputField(
                        w * 0.9,
                        w,
                        "email",
                        "abc@gmail.com",
                        email,
                        Icon(Icons.person_2_outlined,
                            color: Color.fromARGB(255, 233, 236, 239),
                            size: (w / 100) * 7)),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: (h / 100) * 7),
                    child: widgets.myInputField(
                        w * 0.9,
                        w,
                        "password",
                        "123456",
                        pwd,
                        Icon(Icons.password_outlined,
                            color: Color.fromARGB(255, 233, 236, 239),
                            size: (w / 100) * 7)),
                  ),
                  Container(
                    margin:
                        EdgeInsets.only(top: (h / 100) * 7, right: w * 0.05),
                    child: BlocProvider(
                      create: (context) => loginCubit(),
                      child: BlocBuilder<loginCubit, loginState>(
                          builder: (context, state) {
                        if (state is loginStateFilling) {
                          return InkWell(
                            onTap: () {
                              context
                                  .read<loginCubit>()
                                  .submitted(email.text, pwd.text);
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
                                  "Log In",
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
                          if (state is loginStateSubmitted) {
                            getResult(state);
                            context.read<loginCubit>().wrongCredentials();
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
        Positioned(
            bottom: (w / 100) * 8,
            child: InkWell(
                // splashColor: null,
                onTap: () {},
                child: Container(
                  width: w,
                  alignment: Alignment.center,
                  child: Text.rich(
                    TextSpan(
                      text: "Doesn't have Account? ",
                      style: GoogleFonts.getFont("Gowun Dodum").copyWith(
                          color: const Color.fromARGB(255, 33, 37, 41),
                          fontSize: (w / 100) * 5,
                          fontWeight: FontWeight.bold),
                      children: <TextSpan>[
                        TextSpan(
                            text: 'SignUp',
                            style: GoogleFonts.getFont("Gowun Dodum").copyWith(
                                color: const Color.fromARGB(255, 33, 37, 41),
                                fontSize: (w / 100) * 5,
                                fontWeight: FontWeight.bold,
                                decoration: TextDecoration.underline)),
                      ],
                    ),
                  ),
                )))
      ]),
    );
  }

  void getResult(state) async {
    var result = await state.ah.login(state.email, state.pwd);
    if (result) {
      await Navigator.popAndPushNamed(context, routes.selectDisease);
    }
    SnackBar s = SnackBar(
        backgroundColor: const Color.fromARGB(255, 206, 212, 218),
        content: Text(
            "Credentials are not Correct. Please check entered credentials",
            style: GoogleFonts.getFont("Gowun Dodum").copyWith(
                color: const Color.fromARGB(255, 33, 37, 41), fontSize: 20)));
    ScaffoldMessenger.of(context).showSnackBar(s);
  }

  void chechTokenPresence() async {
    globalVariables.setToken().then((value) async {
      if (globalVariables.token != "") {
        await Navigator.popAndPushNamed(context, routes.selectDisease);
      }
    });
  }
}
