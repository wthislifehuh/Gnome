import 'package:first_app/pages/login_register_page/login_page.dart';
import 'package:first_app/style/colours.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'build_page.dart';

class IntroPage extends StatefulWidget {
  const IntroPage({Key? key}) : super(key: key);

  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  final controller = PageController();
  bool isLastPage = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(top: 10.0, left: 10.0, right: 10.0),
        color: AppColors.lightBrown,
        child: PageView(
          controller: controller,
          onPageChanged: (index) {
            setState(() => isLastPage = index == 4);
          },
          children: const [
            BuildPage(
              color: AppColors.lightBrown,
              image: 'images/introPage/intro1.png',
              title: 'UNLOCK THE POWER OF INTELLIGENT FARMING',
              description:
                  'Gnome is an intelligent farming analysis and alert system that aims to enhance agriculture data-driven decision-making by providing real time and forecast insights in farming.  ',
            ),
            BuildPage(
              color: AppColors.lightBrown,
              image: 'images/introPage/intro2.png',
              title: 'STAY AHEAD OF THE GAME',
              description:
                  'Leveraging IoT, AI, and Cloud Computing, Gnome can detect potential issues and generate alerts before major problems arise, thus enabling you to take proactive actions and decisions in response to the problems.',
            ),
            BuildPage(
              color: AppColors.lightBrown,
              image: 'images/introPage/intro3.png',
              title: 'FARMING INSIGHTS',
              description:
                  'Gnome provides weather forecasts, news and farming tips to keep users informed and updated about the latest trends, advancements, and best practices in agriculture.',
            ),
            BuildPage(
              color: AppColors.lightBrown,
              image: 'images/introPage/intro4.png',
              title: 'GET CONNECTED',
              description:
                  'Gnome fosters a sense of community among farmers, enabling enhanced collaboration and sharing of knowledge and experiences.',
            ),
            BuildPage(
              color: AppColors.lightBrown,
              image: 'images/introPage/intro5.png',
              title: 'YOUR   𝔾 ℕ 𝕆 𝕄 𝔼 JOURNEY BEGINS HERE!',
              description: 'Let'
                  's transform your farm with real time insights with GNOME!',
            ),
          ],
        ),
      ),
      bottomSheet: isLastPage
          ? TextButton(
              style: TextButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                foregroundColor: Colors.white,
                backgroundColor: AppColors.darkBrown,
                minimumSize: const Size.fromHeight(70),
                padding: const EdgeInsets.only(right: 20, left: 20),
                side: const BorderSide(
                  color: AppColors.lightBrown,
                  width: 3,
                ),
              ),
              onPressed: () async {
                final prefs = await SharedPreferences.getInstance();
                prefs.setBool('showLogin', true);
                //prefs.setBool('introPageState', true);
                if (context.mounted) {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (context) => const LoginPage(),
                    ),
                  );
                }
              },
              child: const Text(
                '𝔾𝕖𝕥 𝕊𝕥𝕒𝕣𝕥𝕖𝕕',
                style: TextStyle(fontSize: 24),
              ),
            )
          : SizedBox(
              height: 70,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      padding: const EdgeInsets.only(
                          right: 20, left: 20, bottom: 10),
                      child: TextButton(
                          onPressed: () => controller.jumpToPage(4),
                          style: TextButton.styleFrom(
                            fixedSize: const Size.fromHeight(50),
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(30),
                                bottomRight: Radius.circular(30),
                              ),
                            ),
                            foregroundColor: Colors.white,
                            backgroundColor: AppColors.darkBrown,
                          ),
                          child: const Text('           Skip  ',
                              style: TextStyle(fontFamily: 'Poppins'))),
                    ),
                  ),
                  Center(
                    child: SmoothPageIndicator(
                      controller: controller,
                      count: 5,
                      effect: const WormEffect(
                        dotColor: AppColors.darkBrown,
                        activeDotColor: AppColors.brown,
                      ),
                      onDotClicked: (index) => controller.animateToPage(
                        index,
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.easeOut,
                      ),
                    ),
                  ),
                  TextButton(
                      style: TextButton.styleFrom(
                        fixedSize: const Size.fromHeight(50),
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30),
                            bottomLeft: Radius.circular(30),
                          ),
                        ),
                        foregroundColor: Colors.white,
                        backgroundColor: AppColors.darkBrown,
                      ),
                      onPressed: () => controller.nextPage(
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.easeOut),
                      child: const Text('  Next           ',
                          style: TextStyle(fontFamily: 'Poppins'))),
                ],
              ),
            ),
    );
  }
}
