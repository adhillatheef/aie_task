import 'package:flutter/material.dart';

import '../widgets/choose_profile.dart';

class TeacherScreen extends StatelessWidget {
  const TeacherScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const ChooseProfile(imageString: 'assets/images/teacher.png',);
  }
}
