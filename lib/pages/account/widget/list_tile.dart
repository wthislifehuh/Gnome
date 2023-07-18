import 'package:first_app/style/colours.dart';
import 'package:flutter/material.dart';

class GnomeListTile extends StatelessWidget {
  final IconData icon;
  final String text;
  final void Function()? onTap;
  const GnomeListTile(
      {super.key, required this.icon, required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10.0),
      child: ListTile(
        leading: Icon(icon, color: const Color(0xff433831)),
        title: Text(
          text,
          style: const TextStyle(
              color: AppColors.darkBrown,
              fontSize: 13,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w600),
        ),
        onTap: onTap,
      ),
    );
  }
}
