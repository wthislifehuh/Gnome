//import 'package:first_app/pages/news/news_page.dart';
import 'package:first_app/pages/news/newspage.dart';
import 'package:flutter/material.dart';
import 'package:first_app/style/colours.dart';

class NewsDashboard extends StatefulWidget {
  const NewsDashboard({super.key});

  @override
  State<NewsDashboard> createState() => _NewsDashboardState();
}

class _NewsDashboardState extends State<NewsDashboard> {
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
                  const NewsPage(), // return is =>
            ),
          );
        },
        child: Column(
          children: [
            Image.asset('images/icons/news.png', height: 100, width: 100),
            const SizedBox(height: 20),
            const Text(
              'ℕ 𝔼 𝕎 𝕊',
              style: TextStyle(color: AppColors.darkBrown, fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}
