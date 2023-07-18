import 'package:flutter/material.dart';
//import 'package:first_app/style/colours.dart';
import 'package:first_app/model/current_weather_data.dart';
import 'package:intl/intl.dart';

class SunInfo extends StatelessWidget {
  final WeatherDataCurrent weatherDataCurrent;
  const SunInfo({
    Key? key, // Named 'key' parameter added
    required this.weatherDataCurrent,
  }) : super(key: key);

  String getTime(int x) {
    DateTime date = DateTime.fromMillisecondsSinceEpoch(x * 1000);
    String f = DateFormat('jm').format(date);
    return f;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          'images/icons/sunrise.png',
          height: 80,
          width: 70,
        ),
        Container(
          alignment: Alignment.center,
          height: 80,
          margin: const EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Sun Rise',
                style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 14,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                getTime(weatherDataCurrent.current.sunrise!),
                style: const TextStyle(fontFamily: 'Poppins', fontSize: 14),
              ),
            ],
          ),
        ),
        Container(
          alignment: Alignment.center,
          width: 30,
          child: const VerticalDivider(),
        ),
        Image.asset(
          'images/icons/sunset.png',
          height: 120,
          width: 80,
        ),
        Container(
          alignment: Alignment.center,
          margin: const EdgeInsets.all(10),
          height: 120,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Sun Set',
                style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 14,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                getTime(weatherDataCurrent.current.sunset!),
                style: const TextStyle(fontFamily: 'Poppins', fontSize: 14),
              ),
            ],
          ),
        )
      ],
    );
  }
}
