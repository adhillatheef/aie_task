import 'dart:async';

import 'package:aie_task/screens/fingerprint_screen.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

import '../constants/constants.dart';
import 'package:gradient_widgets/gradient_widgets.dart';

class FaceId extends StatefulWidget {
  final CameraDescription cameraDescription;

  const FaceId({super.key, required this.cameraDescription});

  @override
  State<FaceId> createState() => _FaceIdState();
}

class _FaceIdState extends State<FaceId> {
  late CameraController _controller;
  late Future<void> _initializeControllerFuture;
  late Timer _timer;
  double _counter = 0.0;

  @override
  void initState() {
    super.initState();
    _controller = CameraController(
      widget.cameraDescription,
      ResolutionPreset.veryHigh,
    );

    // Next, initialize the controller. This returns a Future.
    _initializeControllerFuture = _controller.initialize();
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
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> const FingerPrint()));
      }
    });
  }

  @override
  void dispose() {
    // Dispose of the controller when the widget is disposed.
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: FutureBuilder(
            future: _initializeControllerFuture,
            builder: (context, snapshot) {
              // if(snapshot.connectionState == ConnectionState.done){
              //   startIncrementing();
              // }
              return Stack(
                children: [
                  Stack(
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height,
                        child: snapshot.connectionState == ConnectionState.done
                            ? CameraPreview(_controller)
                            : const CircularProgressIndicator(),
                      ),
                      Positioned(
                          top: 0,
                          bottom: 200,
                          left: 0,
                          right: 0,
                          child: Image.asset("assets/images/frame.png")),
                      Positioned(
                          top: MediaQuery.of(context).size.height * 2 / 3,
                          left: 0,
                          right: 0,
                          bottom: 0,
                          child: Container(
                            decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(20),
                                    topRight: Radius.circular(20))),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20.0, vertical: 20.0),
                              child: Column(
                                children: [
                                  Center(
                                    child: Text(lookLeft,
                                        style: Theme.of(context)
                                            .textTheme
                                            .displayLarge
                                            ?.copyWith(
                                              color: textHeadingColor,
                                            )),
                                  ),
                                  normalSizedBox,
                                  Text(faceInFrame,
                                      style: Theme.of(context)
                                          .textTheme
                                          .displaySmall
                                          ?.copyWith(
                                            color: textLightGreyColor,
                                          )),
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
                                  SizedBox(
                                      height: 20,
                                      child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                          child: GradientProgressIndicator(
                                            gradient: linearGradient,
                                            value: _counter,
                                          )))
                                ],
                              ),
                            ),
                          ))
                    ],
                  ),
                ],
              );
            }),
      ),
    );
  }
}
