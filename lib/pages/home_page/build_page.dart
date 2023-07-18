import 'package:flutter/material.dart';
import 'package:first_app/style/colours.dart';

class BuildPage extends StatelessWidget {
  final Color color;
  final String image;
  final String title;
  final String description;

  const BuildPage({
    super.key,
    required this.color,
    required this.image,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          alignment: Alignment.centerLeft,
          child: Image.asset(
            "images/GNOME_Logo.png",
            width: 110,
          ),
        ),
        SizedBox(
          height: 300,
          child: Image.asset(
            image,
            fit: BoxFit.fill,
            width: 300,
          ),
        ),
        const SizedBox(height: 10.0),
        Expanded(
          flex: 1,
          child: Container(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: AppColors.darkBrown,
                fontSize: 28,
                fontWeight: FontWeight.bold,
                fontFamily: 'Poppins',
              ),
            ),
          ),
        ),
        Expanded(
          flex: 2,
          child: Container(
            padding: const EdgeInsets.only(left: 33, right: 33),
            child: Text(
              description,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 16,
                color: AppColors.darkBrown,
                fontFamily: 'Poppins',
              ),
            ),
          ),
        ),
      ],
    );
  }
}
