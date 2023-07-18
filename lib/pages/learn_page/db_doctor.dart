import 'package:first_app/pages/doctor/pages/docpage.dart';
import 'package:flutter/material.dart';
import 'package:first_app/style/colours.dart';

class DocDashboard extends StatefulWidget {
  const DocDashboard({super.key});

  @override
  State<DocDashboard> createState() => _DocDashboardState();
}

class _DocDashboardState extends State<DocDashboard> {
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
                  const DocPage(), // return is =>
            ),
          );
        },
        child: Column(
          children: [
            Image.asset('images/icons/clinic.png', height: 100, width: 100),
            const SizedBox(height: 20),
            const Text(
              '𝔾 ℕ 𝕆 𝕄 𝔼   𝔻 𝕆 ℂ',
              style: TextStyle(color: AppColors.darkBrown, fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}
