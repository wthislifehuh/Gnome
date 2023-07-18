import 'package:first_app/style/colours.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class MyButton extends StatelessWidget {
  final String text;
  VoidCallback onPressed;
  MyButton({
    super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(15))),
      onPressed: onPressed,
      color: AppColors.darkBrown,
      child: Text(
        text,
        style: const TextStyle(
          color: Colors.grey,
          fontSize: 15,
          fontFamily: 'Poppins',
        ),
      ),
    );
  }
}
