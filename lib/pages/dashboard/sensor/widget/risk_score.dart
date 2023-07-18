import 'package:first_app/function/notification.dart';
import 'package:flutter/material.dart';
import 'package:first_app/style/colours.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';
import 'package:first_app/pages/dashboard/sensor/sensor_provider.dart';
import 'package:provider/provider.dart';

class RiskScore extends StatefulWidget {
  const RiskScore({super.key}); //,required this.weatherDataCurrent});

  @override
  State<RiskScore> createState() => _RiskScoreState();
}

class _RiskScoreState extends State<RiskScore> {
  @override
  Widget build(BuildContext context) {
    final sensorDataProvider = Provider.of<SensorDataProvider>(context);
    final riskscore = sensorDataProvider.riskscore;
    return GestureDetector(
      onTap: () => notification("Risk Score",
          "GNOME finds that your plants' Risk Score is $riskscore !"),
      child: Column(
        children: [
          const Text(
            'ℝ 𝕀 𝕊 𝕂    𝕊 ℂ 𝕆 ℝ 𝔼',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 20,
          ),
          SleekCircularSlider(
            min: 0.0,
            max: 100.0,
            initialValue: riskscore * 10.0,
            appearance: CircularSliderAppearance(
              customColors: CustomSliderColors(
                hideShadow: true,
                // trackColor: [AppColors.brown, AppColors.darkBr],
                dotColor: AppColors.white,
                trackColor: AppColors.darkBr,
                progressBarColors: riskscore < 3
                    ? [
                        AppColors.darkBrown,
                        AppColors.brown,
                      ]
                    : riskscore >= 3 && riskscore <= 5
                        ? [
                            AppColors.darkBrown,
                            AppColors.brown,
                          ]
                        : riskscore >= 6 && riskscore <= 7
                            ? [
                                AppColors.darkBrown,
                                AppColors.brown,
                                const Color.fromARGB(255, 110, 78, 78),
                              ]
                            : riskscore >= 8 && riskscore <= 9
                                ? [
                                    AppColors.darkBrown,
                                    AppColors.brown,
                                    const Color.fromARGB(255, 110, 84, 84),
                                    const Color.fromARGB(255, 134, 66, 61),
                                    const Color.fromARGB(255, 158, 21, 11),
                                  ]
                                : [
                                    AppColors.darkBrown,
                                    AppColors.brown,
                                    const Color.fromARGB(255, 110, 84, 84),
                                    const Color.fromARGB(255, 134, 66, 61),
                                    const Color.fromARGB(255, 158, 21, 11),
                                    const Color.fromARGB(255, 170, 15, 4)
                                  ],
                gradientStartAngle: 0,
                gradientEndAngle: 180,
                dynamicGradient: true,
              ),
              customWidths:
                  CustomSliderWidths(trackWidth: 19, progressBarWidth: 19),
              infoProperties: InfoProperties(
                  bottomLabelText: riskscore < 3
                      ? "ALL SAFE"
                      : riskscore >= 3 && riskscore <= 5
                          ? "AVERAGE"
                          : riskscore >= 6 && riskscore <= 7
                              ? "RISKY!"
                              : riskscore >= 8 && riskscore <= 9
                                  ? "Very RISKY!"
                                  : "Extremely RISKY!",
                  bottomLabelStyle: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Poppins',
                    color: riskscore < 3
                        ? Colors.green
                        : riskscore >= 3 && riskscore <= 5
                            ? Colors.blueGrey
                            : riskscore >= 6 && riskscore <= 7
                                ? const Color.fromARGB(255, 150, 66, 66)
                                : riskscore >= 8 && riskscore <= 9
                                    ? const Color.fromARGB(255, 150, 17, 7)
                                    : const Color.fromARGB(255, 141, 26, 17),
                  )),
              animationEnabled: true,
            ),
          ),
          const SizedBox(height: 5),
        ],
      ),
    );
  }
}
