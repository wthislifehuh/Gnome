import 'package:first_app/pages/dashboard/farm/farm_page.dart';
import 'package:flutter/material.dart';
import 'package:first_app/style/colours.dart';
import 'package:first_app/style/text.dart';

class FarmDashboard extends StatefulWidget {
  const FarmDashboard({super.key});

  @override
  State<FarmDashboard> createState() => _FarmDashboardState();
}

class _FarmDashboardState extends State<FarmDashboard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          // Navigate to the WeatherPage
          context,
          MaterialPageRoute(builder: (context) => const FarmPage()),
        );
      },
      child: Container(
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
              'images/icons/field.png',
              height: 50.0,
              width: 50.0,
            ),
            const SizedBox(height: 20.0),
            const Text(
              '𝔽 𝔸 ℝ 𝕄',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.w500,
                color: AppColors.darkBrown,
              ),
            ),
            const SizedBox(height: 20.0),
            const PrimaryText(text: 'Management')
          ],
        ),
      ),
    );
  }
}
