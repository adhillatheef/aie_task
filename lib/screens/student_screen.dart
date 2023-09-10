import 'package:flutter/material.dart';

import '../widgets/choose_profile.dart';

class StudentScreen extends StatelessWidget {
  const StudentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const ChooseProfile(imageString: 'assets/images/student.png',);
  }
}
