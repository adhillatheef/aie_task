import 'dart:async';

import 'package:aie_task/constants/constants.dart';
import 'package:aie_task/screens/fill_name_screen.dart';
import 'package:flutter/material.dart';

class FingerPrint extends StatefulWidget {
  const FingerPrint({super.key});

  @override
  State<FingerPrint> createState() => _FingerPrintState();
}

class _FingerPrintState extends State<FingerPrint> {
  late Timer _timer;
  double _counter = 0.0;

  @override
  void initState() {
    super.initState();
    startIncrementing();
  }

  void startIncrementing() {
    const incrementInterval =
    Duration(milliseconds: 50); // Adjust the interval as needed
    const totalDuration = Duration(seconds: 5);
    const targetValue = 1.0; // Set the target value to 0.1
    final increment = (targetValue / totalDuration.inMilliseconds) *
        incrementInterval.inMilliseconds;

    _timer = Timer.periodic(incrementInterval, (timer) {
      if (_counter < targetValue) {
        setState(() {
          _counter += increment;
        });
      } else {
        setState(() {
          _timer.cancel();
        });
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>  FillNameScreen()));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height / 3,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.vertical(
                    bottom: Radius.elliptical(
                        MediaQuery.of(context).size.width, 150.0)),
                image: const DecorationImage(
                    fit: BoxFit.fill,
                    image:
                    AssetImage("assets/images/background_image.png"))),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
            child: Column(
              children: [
                Image.asset("assets/images/finger_print.png"),
                normalSizedBox,
                Text("${(_counter * 100).toStringAsFixed(0)}%",
                    style: Theme.of(context)
                        .textTheme
                        .labelLarge
                        ?.copyWith(
                      fontWeight: FontWeight.w700,
                      color: darkGrey,
                    )),
                normalSizedBox,
                Center(
                  child: Text(touch,
                      style: Theme.of(context)
                          .textTheme
                          .displayLarge
                          ?.copyWith(
                        color: textHeadingColor,
                      )),
                ),
                normalSizedBox,
                Text(touchDescription,
                    style: Theme.of(context)
                        .textTheme
                        .displaySmall
                        ?.copyWith(
                      color: textLightGreyColor,
                    )),
              ],
            ),
          ),

        ],
      ),
    );
  }
}
