import 'package:flutter/material.dart';

import '../constants/constants.dart';
import '../widgets/button.dart';

class ParentScreen extends StatelessWidget {
  const ParentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset("assets/images/thinking.png"),
          Padding(
            padding:
            const EdgeInsets.symmetric(horizontal: 20.0,),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("How you gonna use this app?",
                    style: Theme.of(context).textTheme.displayLarge?.copyWith(
                      color: brandColor,
                    )),
                normalSizedBox,
                Image.asset("assets/images/parent.png",height: 151,width: MediaQuery.of(context).size.width,)
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Button(text: "Submit", onTap: (){

          })),
    );
  }
}
