import 'package:flutter/material.dart';
import 'package:first_app/style/colours.dart';
import 'package:first_app/pages/dashboard/sensor/sensorpage.dart';
import 'package:first_app/pages/dashboard/sensor/sensor_provider.dart';
import 'package:provider/provider.dart';

class SensorDashboard extends StatefulWidget {
  const SensorDashboard({super.key});

  @override
  State<SensorDashboard> createState() => _SensorDashboardState();
}

class _SensorDashboardState extends State<SensorDashboard> {
  @override
  Widget build(BuildContext context) {
    final sensorDataProvider = Provider.of<SensorDataProvider>(context);
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const SensorPage()),
        );
      },
      child: Container(
        constraints: const BoxConstraints(minWidth: 370.0),
        padding: const EdgeInsets.only(
            top: 25.0, left: 25.0, bottom: 25.0, right: 25.0),
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
                  'images/icons/sensor.png',
                  height: 50.0,
                  width: 50.0,
                ),
                const SizedBox(width: 24.0),
                const Text(
                  '𝕊 𝔼 ℕ 𝕊 𝕆 ℝ',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w500,
                    color: AppColors.darkBrown,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30.0),
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
                  child: Image.asset("images/icons/humidity.png",
                      fit: BoxFit.contain),
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  height: 60,
                  width: 60,
                  decoration: BoxDecoration(
                      color: AppColors.lightGrey,
                      borderRadius: BorderRadius.circular(15)),
                  child: Image.asset("images/icons/temperature.png",
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
                      Image.asset("images/icons/soil.png", fit: BoxFit.contain),
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
                        "Air Humidity",
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
                        "${sensorDataProvider.airTemperature.toString()} %rh",
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
                      width: 100,
                      child: Text(
                        "Air Temperature",
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
                        "${sensorDataProvider.airTemperature.toString()} °C",
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
                        "Soil Moisture",
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
                        "${sensorDataProvider.soilMoisture.toString()} %",
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
            ),
          ],
        ),
      ),
    );
  }
}
