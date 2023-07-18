import 'package:flutter/material.dart';
import 'package:first_app/style/colours.dart';
import 'package:first_app/style/text.dart';

class HardWidget extends StatefulWidget {
  final String name;
  final String imagePath;
  final String text;
  const HardWidget(
      {super.key,
      required this.name,
      required this.imagePath,
      required this.text});

  @override
  State<HardWidget> createState() => _HardWidgetState();
}

class _HardWidgetState extends State<HardWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(minWidth: 175.0),
      padding: const EdgeInsets.only(
          top: 20.0, left: 24.0, bottom: 20.0, right: 24.0),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //Icon(Icons.grass_sharp, size: 50.0, color: AppColors.black),
          Image.asset(
            widget.imagePath,
            height: 50.0,
            width: 50.0,
          ),
          const SizedBox(height: 20.0),
          Text(
            widget.name,
            style: const TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.w500,
              color: AppColors.darkBrown,
            ),
          ),
          const SizedBox(height: 20.0),
          PrimaryText(text: widget.text)
        ],
      ),
    );
  }
}
