import 'package:flutter/material.dart';
import 'tips_page.dart';
import 'package:first_app/style/colours.dart';

class TipsDashboard extends StatefulWidget {
  const TipsDashboard({super.key});

  @override
  State<TipsDashboard> createState() => _TipsDashboardState();
}

class _TipsDashboardState extends State<TipsDashboard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, right: 20.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.white,
          foregroundColor: Colors.white,
          shadowColor: Colors.brown,
          elevation: 5,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(32.0),
          ),
          minimumSize: const Size(370, 200),
        ),
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (BuildContext context) =>
                  const TipsPage(), // return is =>
            ),
          );
        },
        child: Column(
          children: [
            Image.asset('images/icons/idea.png', height: 100, width: 100),
            const SizedBox(height: 20),
            const Text(
              '𝔽 𝔸 ℝ 𝕄 𝕀 ℕ 𝔾  𝕋 𝕀 ℙ 𝕊',
              style: TextStyle(color: AppColors.darkBrown, fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}
