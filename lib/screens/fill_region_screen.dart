import 'package:aie_task/screens/choose_profile_screen.dart';
import 'package:flutter/material.dart';

import '../constants/constants.dart';
import '../widgets/button.dart';

class FillRegionScreen extends StatelessWidget {
  final regionController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  FillRegionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset("assets/images/fill_region.png"),
            Padding(
              padding:
              const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Welcome ${StaticData.userName},",
                        style: Theme.of(context).textTheme.displayLarge?.copyWith(
                          color: brandColor,
                        )),
                    Text("What is your region?",
                        style: Theme.of(context).textTheme.displayLarge?.copyWith(
                          color: brandColor,
                        )),
                    normalSizedBox,
                    TextFormField(
                      textCapitalization: TextCapitalization.words,
                      cursorColor: Colors.black,
                      controller: regionController,
                      decoration: InputDecoration(
                        errorStyle:
                        const TextStyle(color: Colors.red, fontSize: 16),
                        hintText: "Enter your region",
                        hintStyle: Theme.of(context)
                            .textTheme
                            .displaySmall
                            ?.copyWith(
                            color: textLightGreyColor,
                            fontWeight: FontWeight.w400),
                        filled: true,
                        fillColor: textFieldColor,
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(32),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please enter your region";
                        } else {
                          return null;
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Button(text: "Next", onTap: (){
            if (_formKey.currentState!.validate()) {
              Navigator.push(context, MaterialPageRoute(builder: (context)=>const ChooseProfile()));
            }
          })),
    );
  }
}
