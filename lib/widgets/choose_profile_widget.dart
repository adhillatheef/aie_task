import 'package:flutter/material.dart';

import '../constants/constants.dart';

class ChooseProfileWidget extends StatelessWidget {
  final  String text;
  final VoidCallback onTap;
  final bool isSelected;
  const ChooseProfileWidget({super.key, required this.text, required this.onTap, required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return  InkWell(
      onTap: onTap,
      child: Container(
        height: 43,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: isSelected? brandColor: chooseProfileTileColor,
        ),
        child: Center(
          child: Text(text, style: Theme.of(context).textTheme.labelLarge?.copyWith(
            color: lightBlack,
          )),
        ),
      ),
    );;
  }
}
