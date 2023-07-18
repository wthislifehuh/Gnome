import 'package:first_app/pages/dashboard/crop/crop.dart';
import 'package:flutter/material.dart';
import 'package:first_app/style/colours.dart';
import 'package:first_app/style/text.dart';

class CropDashboard extends StatefulWidget {
  const CropDashboard({super.key});

  @override
  State<CropDashboard> createState() => _CropDashboardState();
}

class _CropDashboardState extends State<CropDashboard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          // Navigate to the WeatherPage
          context,
          MaterialPageRoute(builder: (context) => const CropPage()),
        );
      },
      child: Container(
        constraints: const BoxConstraints(minWidth: 150.0),
        padding: const EdgeInsets.only(
            top: 20.0, left: 25.0, bottom: 20.0, right: 25.0),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //Icon(Icons.grass_sharp, size: 50.0, color: AppColors.black),
            Image.asset(
              'images/icons/sprout.png',
              height: 50.0,
              width: 50.0,
            ),
            const SizedBox(height: 20.0),
            const Text(
              'ℂ ℝ 𝕆 ℙ',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.w500,
                color: AppColors.darkBrown,
              ),
            ),
            const SizedBox(height: 20.0),
            const PrimaryText(text: 'Good Condition')
          ],
        ),
      ),
    );
  }
}
