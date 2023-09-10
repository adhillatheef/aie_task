import 'package:aie_task/screens/face_id.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../constants/constants.dart';
import '../widgets/button.dart';

class LoginSignUp extends StatelessWidget {
  const LoginSignUp({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              Container(
                height: MediaQuery.of(context).size.height/2,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.vertical(
                        bottom: Radius.elliptical(
                            MediaQuery.of(context).size.width, 150.0)),
                    image: const DecorationImage(
                        fit: BoxFit.fill,
                        image:
                            AssetImage("assets/images/background_image.png"))),
              ),
              Positioned(
                  top: 110,
                  left: 0,
                  right: 0,
                  bottom: 0,
                  child: Image.asset("assets/images/brand_character.png")),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                    alignment: Alignment.topLeft,
                    child: SvgPicture.asset("assets/images/school_pen_logo_new.svg",)),
                normalSizedBox,
                Text(learn, style: Theme.of(context).textTheme.displayLarge?.copyWith(
                  color: textHeadingColor,
                )),
                normalSizedBox,
                Text(learnAndGrow, style: Theme.of(context).textTheme.displaySmall?.copyWith(
                  color: textLightGreyColor,
                )),
                normalSizedBox,
                normalSizedBox,
                Button(text: 'Get Started', onTap: () async{
                  final navigator = Navigator.of(context);
                  final cameras = await availableCameras();
                  final firstCamera = cameras.last;
                  navigator.push(MaterialPageRoute(builder: (context)=>  FaceId(cameraDescription: firstCamera,)));
                },),
                normalSizedBox,
                Button(text: 'Join as admin', onTap: () { },)
              ],
            ),
          ),
        ],
      ),
    );
  }
}
