import 'package:flutter/material.dart';
import 'package:first_app/style/colours.dart';
import 'package:intl/intl.dart';
import 'package:first_app/model/daily_weather_data.dart';

class DailyForecast extends StatelessWidget {
  // final WeatherDataDaily weatherDataDaily;
  // const DailyForecast({required this.weatherDataDaily});
  final WeatherDataDaily weatherDataDaily;

  const DailyForecast({
    super.key,
    required this.weatherDataDaily,
  });

  String getDay(int dt) {
    DateTime date = DateTime.fromMillisecondsSinceEpoch(dt * 1000);
    String x = DateFormat('EEE').format(date);
    return x;
  }

  Widget dailyList() {
    return SizedBox(
      // height: 300,
      child: ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: weatherDataDaily.daily.length > 7
            ? 7
            : weatherDataDaily.daily.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              Container(
                height: 50,
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      getDay(weatherDataDaily.daily[index].dt!),
                      style:
                          const TextStyle(fontFamily: 'Poppins', fontSize: 14),
                    ),
                    SizedBox(
                      height: 30,
                      width: 30,
                      child: Image.asset(
                          'images/weather/${weatherDataDaily.daily[index].weather![0].icon}.png'),
                    ),
                    Text(
                      '${weatherDataDaily.daily[index].temp!.min}°/${weatherDataDaily.daily[index].temp!.max}°',
                      style:
                          const TextStyle(fontFamily: 'Poppins', fontSize: 14),
                    ),
                  ],
                ),
              ),
              Container(height: 1, color: AppColors.lightGrey)
            ],
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      //height: 400,
      margin: const EdgeInsets.all(20),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
          color: AppColors.lightGrey.withAlpha(150),
          borderRadius: BorderRadius.circular(20)),
      child: Column(
        children: [
          Container(
            alignment: Alignment.topLeft,
            child: const Text(
              '𝟟 𝔻𝕒𝕪𝕤 𝔽𝕠𝕣𝕖𝕔𝕒𝕤𝕥',
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
            ),
          ),
          dailyList(),
        ],
      ),
    );
  }
}
