import 'package:flutter/material.dart';

import '../constants/constants.dart';

class Button extends StatelessWidget {
  final  String text;
  final VoidCallback onTap;
  const Button({super.key, required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 55,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color:brandColor,
        ),
        child: Center(
          child: Text(text, style: Theme.of(context).textTheme.labelLarge?.copyWith(
            color: Colors.white,
          )),
        ),
      ),
    );
  }
}
