import 'package:first_app/style/colours.dart';
import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final String title;
  final void Function() onTap;
  const Button({
    Key? key,
    required this.title,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 60,
        width: 180,
        margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.only(left: 20, right: 20, bottom: 8, top: 8),
        decoration: BoxDecoration(
            color: AppColors.darkBrown,
            borderRadius: BorderRadius.circular(26)),
        child: Center(
            child: Text(title,
                style: const TextStyle(
                    fontSize: 16, color: Colors.white, fontFamily: 'Poppins'))),
      ),
    );
  }
}
