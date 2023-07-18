import 'package:first_app/pages/learn_page/db_doctor.dart';
import 'package:first_app/pages/learn_page/db_tips.dart';
import 'package:first_app/style/colours.dart';
import 'package:flutter/material.dart';
import 'package:first_app/pages/learn_page/db_news.dart';

class LearnPage extends StatefulWidget {
  const LearnPage({super.key});

  @override
  State<LearnPage> createState() => _LearnPageState();
}

class _LearnPageState extends State<LearnPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('𝕀 ℕ 𝕊 𝕀 𝔾 ℍ 𝕋 𝕊'),
          backgroundColor: const Color(0xff433831),
          actions: [
            IconButton(
              icon: const Icon(Icons.calendar_month),
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(Icons.notifications),
              onPressed: () {},
            ),
          ],
        ),
        backgroundColor: AppColors.lightBr,
        body: Container(
          width: double.infinity,
          height: double.infinity,
          color: AppColors.lightBr,
          child: const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              NewsDashboard(),
              SizedBox(height: 20),
              DocDashboard(),
              SizedBox(height: 20),
              TipsDashboard(),
            ],
          ),
        ));
  }
}
