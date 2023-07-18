import 'package:flutter/material.dart';
import 'package:first_app/style/colours.dart';
import 'package:first_app/model/current_weather_data.dart';

class CurrentWeatherWidget extends StatelessWidget {
  final WeatherDataCurrent weatherDataCurrent;
  const CurrentWeatherWidget(this.weatherDataCurrent);

  Widget CurrentWeatherDataWidget() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        const SizedBox(width: 5),
        Image.asset(
          "images/weather/${weatherDataCurrent.current.weather![0].icon}.png",
          height: 80,
          width: 80,
        ),
        Container(
          width: 1,
          height: 50,
          color: AppColors.grey,
        ),
        RichText(
          text: TextSpan(children: [
            TextSpan(
              text: "${weatherDataCurrent.current.temp}°",
              style: const TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 68,
                color: AppColors.darkBrown,
                fontFamily: 'Poppins',
              ),
            ),
            TextSpan(
              text: "${weatherDataCurrent.current.weather![0].description}",
              style: const TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                  color: Colors.grey,
                  fontFamily: 'Poppins'),
            ),
          ]),
        )
      ],
    );
  }

  Widget MoreDetailsOnCurrentWeatherData() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              height: 60,
              width: 60,
              decoration: BoxDecoration(
                  color: AppColors.lightGrey,
                  borderRadius: BorderRadius.circular(15)),
              child: Image.asset("images/icons/windspeed.png",
                  fit: BoxFit.contain),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              height: 60,
              width: 60,
              decoration: BoxDecoration(
                  color: AppColors.lightGrey,
                  borderRadius: BorderRadius.circular(15)),
              child:
                  Image.asset("images/icons/clouds.png", fit: BoxFit.contain),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              height: 60,
              width: 60,
              decoration: BoxDecoration(
                  color: AppColors.lightGrey,
                  borderRadius: BorderRadius.circular(15)),
              child:
                  Image.asset("images/icons/humidity.png", fit: BoxFit.contain),
            ),
          ],
        ),
        const SizedBox(
          height: 7,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              children: [
                const SizedBox(height: 5, width: 80),
                const SizedBox(
                  height: 20,
                  width: 80,
                  child: Text(
                    "Wind Speed",
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Poppins',
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(height: 5, width: 80),
                SizedBox(
                  height: 20,
                  width: 80,
                  child: Text(
                    "${weatherDataCurrent.current.windSpeed}  km/h",
                    style: const TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Poppins',
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
            Column(
              children: [
                const SizedBox(height: 5, width: 80),
                const SizedBox(
                  height: 20,
                  width: 80,
                  child: Text(
                    "Cloudy",
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Poppins',
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(height: 5, width: 80),
                SizedBox(
                  height: 20,
                  width: 80,
                  child: Text(
                    "${weatherDataCurrent.current.clouds} %",
                    style: const TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'Poppins'),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
            Column(
              children: [
                const SizedBox(height: 5, width: 80),
                const SizedBox(
                  height: 20,
                  width: 80,
                  child: Text(
                    "Humidity",
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Poppins',
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(height: 5, width: 80),
                SizedBox(
                  height: 20,
                  width: 80,
                  child: Text(
                    "${weatherDataCurrent.current.humidity} %",
                    style: const TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'Poppins'),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ],
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //current weather
        CurrentWeatherDataWidget(),
        const SizedBox(
          height: 20,
        ),
        //More details
        MoreDetailsOnCurrentWeatherData(),
      ],
    );
  }
}
