import 'package:aie_task/constants/constants.dart';
import 'package:aie_task/screens/fill_region_screen.dart';
import 'package:aie_task/widgets/button.dart';
import 'package:flutter/material.dart';

class FillNameScreen extends StatelessWidget {
  final nameController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  FillNameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset("assets/images/thinking.png"),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(fillName,
                      style: Theme.of(context).textTheme.displayLarge?.copyWith(
                            color: brandColor,
                          )),
                  normalSizedBox,
                  TextFormField(
                    textCapitalization: TextCapitalization.words,
                    cursorColor: Colors.black,
                    controller: nameController,
                    decoration: InputDecoration(
                      errorStyle:
                          const TextStyle(color: Colors.red, fontSize: 16),
                      hintText: "Enter your name",
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
                        return "Please enter your name";
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
            child: Button(text: "Submit", onTap: (){
              if (_formKey.currentState!.validate()) {
                StaticData.userName = nameController.text;
                Navigator.push(context, MaterialPageRoute(builder: (context)=>FillRegionScreen()));
              }
            })),
        );
  }
}
