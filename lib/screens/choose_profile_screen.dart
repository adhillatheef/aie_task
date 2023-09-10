import 'package:aie_task/screens/parent_screen.dart';
import 'package:aie_task/screens/student_screen.dart';
import 'package:aie_task/screens/teacher_screen.dart';
import 'package:flutter/material.dart';

import '../constants/constants.dart';
import '../widgets/button.dart';
import '../widgets/choose_profile_widget.dart';

class ChooseProfile extends StatefulWidget {
  const ChooseProfile({super.key});
  @override
  State<ChooseProfile> createState() => _ChooseProfileState();
}

class _ChooseProfileState extends State<ChooseProfile> {
  int selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    List <String> items = [
      "Student",
      "Teacher",
      "Parent",
    ];

    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset("assets/images/thinking.png"),
          Padding(
            padding:
            const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("How you gonna use this app?",
                    style: Theme.of(context).textTheme.displayLarge?.copyWith(
                      color: brandColor,
                    )),
                GridView.builder(
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    mainAxisExtent: 45,
                    crossAxisCount: 2, // Number of columns in the grid
                    crossAxisSpacing: 10.0, // Optional spacing between columns
                    mainAxisSpacing: 10.0, // Optional spacing between rows
                  ),
                  itemBuilder: (BuildContext context, int index) {
                    return ChooseProfileWidget(text: items[index], onTap: (){
                      setState(() {
                        selectedIndex = index;
                        debugPrint("Selected Index $selectedIndex");
                      });
                    }, isSelected: index == selectedIndex); // Return the ChooseProfileWidget
                  },
                  itemCount: items.length, // The number of items in the grid
                )
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Button(text: "Submit", onTap: (){
              if(selectedIndex == 0){
                Navigator.push(context, MaterialPageRoute(builder: (context)=> const StudentScreen()));
              }else if(selectedIndex == 1){
                Navigator.push(context, MaterialPageRoute(builder: (context)=> const TeacherScreen()));
              }else{
                Navigator.push(context, MaterialPageRoute(builder: (context)=> const ParentScreen()));
              }
          })),
    );
  }
}
