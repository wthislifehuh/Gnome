import 'package:first_app/style/colours.dart';
import 'package:flutter/material.dart';

class PrimaryText extends StatelessWidget {
  final double size;
  final FontWeight weight;
  final Color color;
  final String text;
  final double height;

  const PrimaryText({
    super.key,
    this.size = 16.0,
    this.weight = FontWeight.w400,
    this.color = AppColors.darkBrown,
    required this.text,
    this.height = 1.3,
  });

  @override
  Widget build(BuildContext context) {
    return Text(text,
        style: TextStyle(
          fontSize: size,
          fontWeight: weight,
          fontFamily: 'Poppins',
          color: color,
          height: height,
        ));
  }
}
