import 'dart:async';

import 'package:aie_task/screens/login_signup.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../constants/constants.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    asyncMethod();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset("assets/images/pen.svg"),
            normalSizedBox,
            SvgPicture.asset("assets/images/school_pen.svg"),
            normalSizedBox,
            const CircularProgressIndicator(color: Color(0xffce7cdd),)
          ],
        ),
      ),
    );
  }

  asyncMethod() async{
    Timer(const Duration(seconds: 3),
            ()=>Navigator.pushReplacement(context, MaterialPageRoute(
            builder: (context) => const LoginSignUp()
        )
        )
    );
  }
}

