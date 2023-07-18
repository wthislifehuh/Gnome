import 'package:first_app/style/colours.dart';
import 'package:flutter/material.dart';
import 'package:first_app/pages/dashboard/weatherPage/widget/wt_header.dart';
import 'package:get/get.dart';
import 'package:first_app/controller/global_controller.dart';
import 'package:first_app/pages/dashboard/weatherPage/widget/current_weather.dart';
import 'package:first_app/pages/dashboard/weatherPage/widget/hourly_data_widget.dart';
import 'package:first_app/pages/dashboard/weatherPage/widget/sunInfo.dart';
import 'package:first_app/pages/dashboard/weatherPage/widget/daily_forecast.dart';
import 'package:first_app/pages/dashboard/weatherPage/widget/ComfortLevel.dart';

class Weather extends StatefulWidget {
  const Weather({super.key});

  @override
  State<Weather> createState() => _WeatherState();
}

class _WeatherState extends State<Weather> {
  final GlobalController globalController =
      Get.put(GlobalController(), permanent: true);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('𝕎 𝔼 𝔸 𝕋 ℍ 𝔼 ℝ'),
        backgroundColor: const Color(0xff433831),
      ),
      backgroundColor: AppColors.lightBrown,
      body: SafeArea(
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
              : ListView(
                  scrollDirection: Axis.vertical,
                  children: [
                    const SizedBox(height: 20),
                    const WeatherHeader(),
                    CurrentWeatherWidget(
                        globalController.getWeatherData().weatherDataCurrent()),
                    const SizedBox(
                      height: 20,
                    ),
                    const Divider(
                      color: AppColors.grey,
                    ),
                    HourlyDataWidget(
                      weatherDataHourly:
                          globalController.getWeatherData().weatherDataHourly(),
                    ),
                    SunInfo(
                        weatherDataCurrent: globalController
                            .getWeatherData()
                            .weatherDataCurrent()),
                    DailyForecast(
                      weatherDataDaily:
                          globalController.getWeatherData().weatherDataDaily(),
                    ),
                    const Divider(
                      color: AppColors.grey,
                    ),
                    ComfortLevel(
                      weatherDataCurrent: globalController
                          .getWeatherData()
                          .weatherDataCurrent(),
                    )
                  ],
                ),
        ),
      ),
    );
  }
}
