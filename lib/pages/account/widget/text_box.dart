import 'package:first_app/style/colours.dart';
import 'package:flutter/material.dart';

class MyTextBox extends StatelessWidget {
  final String text;
  final String sectionName;
  final void Function()? onPressed;
  const MyTextBox(
      {super.key,
      required this.text,
      required this.sectionName,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      padding: const EdgeInsets.only(left: 20, right: 10, bottom: 15),
      margin: const EdgeInsets.only(left: 20, right: 20, top: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              //section name
              Text(
                sectionName,
                style: TextStyle(
                    color: Colors.grey[500],
                    fontFamily: 'Poppins',
                    fontSize: 15),
              ),

              //edit button
              IconButton(
                onPressed: onPressed,
                icon: const Icon(Icons.edit),
                color: Colors.grey[400],
              )
            ],
          ),

          //text
          Text(
            text,
            style: const TextStyle(
              fontFamily: 'Poppins',
              color: AppColors.darkBrown,
              fontSize: 15,
            ),
          ),
        ],
      ),
    );
  }
}
