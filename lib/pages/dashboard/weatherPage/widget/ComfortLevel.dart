import 'package:flutter/material.dart';
import 'package:first_app/model/current_weather_data.dart';
import 'package:first_app/style/colours.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';

class ComfortLevel extends StatelessWidget {
  final WeatherDataCurrent weatherDataCurrent;
  const ComfortLevel({super.key, required this.weatherDataCurrent});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          'ℂ 𝕆 𝕄 𝔽 𝕆 ℝ 𝕋    𝕃 𝔼 𝕍 𝔼 𝕃',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 20,
        ),
        SleekCircularSlider(
          min: 0,
          max: 100,
          initialValue: weatherDataCurrent.current.humidity!.toDouble(),
          appearance: CircularSliderAppearance(
            customColors: CustomSliderColors(
              hideShadow: true,
              trackColor: AppColors.darkBr,
              dotColor: AppColors.white,
              progressBarColor: AppColors.brown,
            ),
            customWidths:
                CustomSliderWidths(trackWidth: 19, progressBarWidth: 19),
            infoProperties: InfoProperties(
                bottomLabelText: "Humidity",
                bottomLabelStyle: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'Poppins',
                )),
            animationEnabled: true,
          ),
        ),
        const SizedBox(height: 5),
        Container(
          margin: const EdgeInsets.only(bottom: 30),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const SizedBox(width: 10),
              Container(
                padding: const EdgeInsets.all(10),
                height: 60,
                width: 60,
                decoration: BoxDecoration(
                    color: AppColors.lightGrey,
                    borderRadius: BorderRadius.circular(15)),
                child: Image.asset("images/icons/thermometer.png",
                    fit: BoxFit.contain),
              ),
              Column(
                children: [
                  const Text(
                    'Feels Like',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Poppins',
                    ),
                  ),
                  Text(
                    '${weatherDataCurrent.current.feels_like}',
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'Poppins',
                    ),
                  ),
                ],
              ),
              Container(
                padding: const EdgeInsets.all(10),
                height: 60,
                width: 60,
                decoration: BoxDecoration(
                    color: AppColors.lightGrey,
                    borderRadius: BorderRadius.circular(15)),
                child: Image.asset("images/icons/umbrella.png",
                    fit: BoxFit.contain),
              ),
              Column(
                children: [
                  const Text(
                    'UV Index',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Poppins',
                    ),
                  ),
                  Text(
                    '${weatherDataCurrent.current.uvi}',
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'Poppins',
                    ),
                  ),
                ],
              ),
              const SizedBox(width: 10),
            ],
          ),
        )
      ],
    );
  }
}
