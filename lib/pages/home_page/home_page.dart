import 'package:first_app/pages/account/profile_page.dart';
import 'package:first_app/pages/dashboard/dashboardPage.dart';
import 'package:first_app/pages/learn_page/learn_page.dart';
import 'package:first_app/pages/sharing_page/sharing_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: currentIndex == 0
            ? const Dashboard()
            : currentIndex == 1
                ? const LearnPage()
                : currentIndex == 2
                    ? const SharingPage()
                    : const ProfilePage(),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Dashboard',
            backgroundColor: Color(0xff433831),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.lightbulb),
            label: 'Insights',
            backgroundColor: Color(0xff433831),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people),
            label: 'Community',
            backgroundColor: Color(0xff433831),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
            backgroundColor: Color(0xff433831),
          ),
        ],
      ),
    );
  }
}
