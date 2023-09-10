import 'package:flutter/material.dart';

import '../widgets/choose_profile.dart';

class ParentScreen extends StatelessWidget {
  const ParentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const ChooseProfile(imageString: 'assets/images/parent.png',);
  }
}
