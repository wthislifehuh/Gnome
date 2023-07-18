import 'package:first_app/pages/todo/todo_page.dart';
import 'package:flutter/material.dart';
import 'package:first_app/style/colours.dart';
import 'package:first_app/style/text.dart';

class ToDoDashboard extends StatefulWidget {
  const ToDoDashboard({super.key});

  @override
  State<ToDoDashboard> createState() => _ToDoDashboardState();
}

class _ToDoDashboardState extends State<ToDoDashboard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          // Navigate to the WeatherPage
          context,
          MaterialPageRoute(builder: (context) => const TODOPage()),
        );
      },
      child: Container(
        constraints: const BoxConstraints(minWidth: 175.0),
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
              'images/icons/todo.png',
              height: 50.0,
              width: 50.0,
            ),
            const SizedBox(height: 20.0),
            const Text(
              '𝕋 𝕆-𝔻 𝕆',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.w500,
                color: AppColors.darkBrown,
              ),
            ),
            const SizedBox(height: 20.0),
            const PrimaryText(text: 'Make Decision')
          ],
        ),
      ),
    );
  }
}
