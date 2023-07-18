import 'package:first_app/pages/dashboard/sensor/widget/suggestion.dart';
import 'package:flutter/material.dart';
import 'package:first_app/style/colours.dart';
import 'package:first_app/style/text.dart';
import 'package:first_app/pages/dashboard/sensor/sensor_provider.dart';
import 'package:provider/provider.dart';

class DHT11 extends StatefulWidget {
  const DHT11({super.key});

  @override
  State<DHT11> createState() => _DHT11State();
}

class _DHT11State extends State<DHT11> {
  @override
  Widget build(BuildContext context) {
    final sensorDataProvider = Provider.of<SensorDataProvider>(context);
    return Center(
      child: Container(
        constraints: const BoxConstraints(minWidth: 350.0),
        padding: const EdgeInsets.only(
            top: 30.0, left: 30.0, bottom: 30.0, right: 25.0),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Image.asset(
                  'images/icons/moisturetemp.png',
                  height: 50.0,
                  width: 50.0,
                ),
                const SizedBox(width: 24.0),
                const Text(
                  'DHT11 Sensor',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w500,
                    color: AppColors.darkBrown,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20.0),

            // Air Humidity
            const PrimaryText(text: 'Air Humidity: '),
            const SizedBox(height: 10.0),

            Center(
              child: Column(
                children: [
                  PrimaryText(
                      text: '${sensorDataProvider.airHumidity.toString()}  %',
                      size: 18,
                      weight: FontWeight.w500),
                  const SizedBox(height: 6.0),
                  if (sensorDataProvider.airHumidity < 60.0)
                    const PrimaryText(
                      text: 'Low Humidity!',
                      color: Colors.red,
                    )
                  else if (sensorDataProvider.airHumidity > 60.0 &&
                      sensorDataProvider.airHumidity < 80.0)
                    const PrimaryText(
                        text: 'Perfect Humidity, good for plants\' growth',
                        color: Colors.green)
                  else if (sensorDataProvider.airHumidity > 80.0)
                    const PrimaryText(
                        text: 'High Humidity!', color: Colors.red),
                  const Suggestion(name: "Humidity"),
                ],
              ),
            ),

            const SizedBox(height: 30.0),

            // Air Temperature
            const PrimaryText(text: 'Air Temperature: '),
            const SizedBox(height: 10.0),
            Center(
              child: Column(
                children: [
                  PrimaryText(
                      text:
                          '${sensorDataProvider.airTemperature.toString()}  °C',
                      size: 18,
                      weight: FontWeight.w500),
                  const SizedBox(height: 7.0),
                  if (sensorDataProvider.airTemperature < 20.0)
                    const PrimaryText(
                        text: 'Low Temperature!', color: Colors.red)
                  else if (sensorDataProvider.airTemperature >= 20.0 &&
                      sensorDataProvider.airTemperature < 25.0)
                    const PrimaryText(
                        text: 'Perfect Temperature', color: Colors.green)
                  else if (sensorDataProvider.airTemperature >= 25.0 &&
                      sensorDataProvider.airTemperature <= 30.0)
                    const PrimaryText(
                        text: 'A bit high Temperature', color: Colors.red)
                  else
                    const PrimaryText(
                        text: 'High Temperature! Problem might occur!',
                        color: Colors.red),
                ],
              ),
            ),

            const Suggestion(name: "Temperature"),
          ],
        ),
      ),
    );
  }
}
