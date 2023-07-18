import 'package:flutter/material.dart';
import 'package:first_app/style/colours.dart';
//import 'package:first_app/pages/dashboard/weather/weather.dart';
import 'package:first_app/pages/dashboard/weatherPage/weather_page.dart';
import 'package:first_app/pages/dashboard/weatherPage/widget/current_weather.dart';
import 'package:get/get.dart';
import 'package:first_app/controller/global_controller.dart';

class WeatherDashboard extends StatefulWidget {
  const WeatherDashboard({super.key});

  @override
  State<WeatherDashboard> createState() => _WeatherDashboardState();
}

class _WeatherDashboardState extends State<WeatherDashboard> {
  final GlobalController globalController =
      Get.put(GlobalController(), permanent: true);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          // Navigate to the WeatherPage
          context,
          MaterialPageRoute(builder: (context) => const Weather()),
        );
      },
      child: Container(
        constraints: const BoxConstraints(minWidth: 350.0),
        padding: const EdgeInsets.only(
            top: 10.0, left: 10.0, bottom: 10.0, right: 10.0),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Obx(
          () => globalController.checkLoading().isTrue
              ? Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset('images/GNOME_Logo.png',
                          width: 100, height: 100),
                      const SizedBox(
                        height: 10,
                      ),
                      const CircularProgressIndicator(),
                    ],
                  ),
                )
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding:
                          const EdgeInsets.only(top: 20, left: 10, bottom: 2),
                      child: const Text(
                        '𝕎 𝔼 𝔸 𝕋 ℍ 𝔼 ℝ',
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.w500,
                          color: AppColors.darkBrown,
                        ),
                      ),
                    ),
                    CurrentWeatherWidget(
                        globalController.getWeatherData().weatherDataCurrent()),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}
