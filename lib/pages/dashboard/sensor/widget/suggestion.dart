import 'package:first_app/style/colours.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:first_app/pages/dashboard/sensor/sensor_provider.dart';

class Suggestion extends StatelessWidget {
  final String name;
  const Suggestion({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    final sensorDataProvider = Provider.of<SensorDataProvider>(context);
    final riskscore = sensorDataProvider.riskscore;
    final airhumidity = sensorDataProvider.airHumidity;
    final airtemp = sensorDataProvider.airTemperature;
    final soilmoisture = sensorDataProvider.soilMoisture;

    String suggestion;

    if (name == "Risk") {
      suggestion = riskscore < 1
          ? "Excellent!\nYour plants are quite safe"
          : riskscore >= 2 && riskscore <= 3
              ? "Little Risk\nPlease check the sensor data and suggestions for the risk detected."
              : riskscore >= 4 && riskscore <= 5
                  ? "Moderate Risk\nPlease check the sensor data and suggestions for the risk detected."
                  : riskscore >= 6 && riskscore <= 7
                      ? "ALERT: Your plants are at risk!\nPlease check the sensor data and suggestions for the risk detected."
                      : riskscore >= 8 && riskscore <= 9
                          ? "ALERT: Your plants are in great danger!\nPlease check the sensor data and suggestions for the risk detected."
                          : "ALERT: Extremely high risk for your plants!\nPlease check the sensor data and suggestions for the risk detected.";
    } else if (name == "Humidity") {
      suggestion = airhumidity < 30.0
          ? "Consider using misting systems or humidifiers."
          : airhumidity >= 30 && airhumidity <= 60.0
              ? "Placing trays of water near plants or using pebble trays filled with water can help increase local humidity."
              : airhumidity > 60 && airhumidity <= 80.0
                  ? "Excellent! Maintain regular watering and cultivation practices."
                  : "Using fans, exhaust systems, or dehumidifiers can help control humidity levels.";
    } else if (name == "Temperature") {
      suggestion = airtemp <= 20
          ? "Consider planting cold-tolerant varieties or using techniques like raised beds."
          : airtemp > 20 && airtemp < 25.0
              ? "Great! Continue regular cultivation practices."
              : airtemp >= 25.0 && airtemp <= 30.0
                  ? "Increasing air circulation and implementing proper irrigation practices."
                  : " Take immediate action: Use evaporative cooling methods and increasing irrigation frequency.";
    } else if (name == "Soil Moisture") {
      suggestion = soilmoisture <= 20.0
          ? "Use drip irrigating and sprinklers to ensure even distribution of water. Mulching the soil can also help retain moisture."
          : soilmoisture >= 21.0 && soilmoisture <= 40.0
              ? "Great! Monitoring the soil moisture regularly is important to prevent it from becoming too dry or too wet."
              : soilmoisture >= 41.0 && soilmoisture <= 60.0
                  ? "Excellent! Continue regular watering practices appropriate for vegetables."
                  : soilmoisture >= 61.0 && soilmoisture <= 80.0
                      ? "Be cautious not to overwater the soil and risk waterlogging."
                      : "Consider implementing drainage systems, such as installing tiles or ditches,creating raised beds or mounding soil to remove excess water from the soil";
    } else {
      suggestion = "No suggestions available for this risk.";
    }
    return Center(
      child: Container(
        constraints: const BoxConstraints(minWidth: 200.0),
        margin: const EdgeInsets.only(top: 20, bottom: 5),
        padding: const EdgeInsets.only(
            top: 20.0, left: 20.0, bottom: 20.0, right: 20.0),
        decoration: BoxDecoration(
          color: AppColors.darkBr.withOpacity(0.3),
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //Icon(Icons.grass_sharp, size: 50.0, color: AppColors.black),
            Row(
              children: [
                Image.asset(
                  'images/icons/idea.png',
                  height: 30.0,
                  width: 30.0,
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(
                    suggestion,
                    style: const TextStyle(
                      fontSize: 14.0,
                      fontWeight: FontWeight.w500,
                      color: AppColors.darkBrown,
                      fontStyle: FontStyle.italic,
                      fontFamily: 'Poppins',
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
