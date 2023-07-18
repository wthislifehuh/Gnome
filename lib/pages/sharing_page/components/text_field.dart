import 'package:first_app/style/colours.dart';
import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final bool obscureText;
  const MyTextField(
      {super.key,
      required this.controller,
      required this.hintText,
      required this.obscureText});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: obscureText,
      textAlignVertical: TextAlignVertical.center,
      autofocus: true,
      style: const TextStyle(
        color: AppColors.darkBrown,
        fontSize: 16,
        fontFamily: 'Poppins',
      ),
      decoration: InputDecoration(
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.darkBrown, width: 1.5),
          ),
          focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.darkBr)),
          fillColor: AppColors.lightBrown,
          filled: true,
          hintText: hintText,
          hintStyle:
              const TextStyle(color: Color.fromARGB(255, 158, 149, 149))),
    );
  }
}
