import 'package:first_app/pages/dashboard/sensor/widget/suggestion.dart';
import 'package:flutter/material.dart';
import 'package:first_app/style/colours.dart';
import 'package:first_app/style/text.dart';
import 'package:first_app/pages/dashboard/sensor/sensor_provider.dart';
import 'package:provider/provider.dart';

class SoilMoisture extends StatefulWidget {
  const SoilMoisture({super.key});

  @override
  State<SoilMoisture> createState() => _SoilMoistureState();
}

class _SoilMoistureState extends State<SoilMoisture> {
  @override
  Widget build(BuildContext context) {
    final sensorDataProvider = Provider.of<SensorDataProvider>(context);
    return Center(
      child: Container(
        constraints: const BoxConstraints(minWidth: 350.0),
        padding: const EdgeInsets.only(
            top: 30.0, left: 30.0, bottom: 30.0, right: 30.0),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //Icon(Icons.grass_sharp, size: 50.0, color: AppColors.black),
            Row(
              children: [
                Image.asset(
                  'images/icons/moisture.png',
                  height: 50.0,
                  width: 50.0,
                ),
                const SizedBox(width: 24.0),
                const Text(
                  'Soil Moisture Sensor',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w500,
                    color: AppColors.darkBrown,
                    fontFamily: 'Poppins',
                  ),
                ),
              ],
            ),

            const SizedBox(height: 20.0),
            const PrimaryText(text: 'Soil Moisture: '),
            const SizedBox(height: 10.0),
            Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  PrimaryText(
                      text: '${sensorDataProvider.soilMoisture.toString()}',
                      size: 18,
                      weight: FontWeight.w500),
                  const SizedBox(height: 6.0),
                  if (sensorDataProvider.soilMoisture == 1)
                    const PrimaryText(
                        text: 'Soil is extremely dry!', color: Colors.red)
                  else if (sensorDataProvider.soilMoisture == 0)
                    const PrimaryText(
                        text: 'Perfect moisture, good for vegetables',
                        color: Colors.green)
                  // else if (sensorDataProvider.soilMoisture >= 41.0 &&
                  //     sensorDataProvider.soilMoisture <= 60.0)
                  //   const PrimaryText(
                  //       text: 'Perfect moisture, good for vegetables',
                  //       color: Colors.green)
                  // else if (sensorDataProvider.soilMoisture >= 61.0 &&
                  //     sensorDataProvider.soilMoisture <= 80.0)
                  //   const PrimaryText(
                  //       text: 'Nice moisture, good for vegetables',
                  //       color: Colors.green)
                  // else
                  //   const PrimaryText(
                  //       text: 'Soil is too moist!', color: Colors.red),
                ],
              ),
            ),

            const Suggestion(
              name: "Soil Moisture",
            ),
          ],
        ),
      ),
    );
  }
}
