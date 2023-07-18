import 'package:flutter/material.dart';
import 'package:first_app/style/colours.dart';
import 'package:first_app/style/text.dart';
import 'package:provider/provider.dart';
import 'package:first_app/pages/dashboard/sensor/sensor_provider.dart';
import 'package:first_app/function/notification.dart';

class AddSensor extends StatefulWidget {
  const AddSensor({super.key});

  @override
  State<AddSensor> createState() => _AddSensorState();
}

class _AddSensorState extends State<AddSensor> {
  @override
  Widget build(BuildContext context) {
    final sensorDataProvider = Provider.of<SensorDataProvider>(context);
    final riskscore = sensorDataProvider.riskscore;
    final airhumidity = sensorDataProvider.airHumidity;
    final airtemp = sensorDataProvider.airTemperature;
    final soilmoisture = sensorDataProvider.soilMoisture;

    String notificationMessage;
    String humiditySuggestion = "Perfect Humidity";
    String temperatureSuggestion = "Perfect Temperature";
    String soilMoistureSuggestion = "Perfect Soil Moisture";

    if (riskscore > 5) {
      notificationMessage = riskscore >= 6 && riskscore <= 7
          ? "ALERT: Your plants are at risk!"
          : riskscore >= 8 && riskscore <= 9
              ? "ALERT: Your plants are in great danger!"
              : "ALERT: Extremely high risk for your plants!";

      humiditySuggestion = airhumidity < 30.0
          ? "Consider using misting systems or humidifiers."
          : airhumidity >= 30 && airhumidity <= 60.0
              ? "Placing trays of water near plants or using pebble trays filled with water can help increase local humidity."
              : airhumidity > 60 && airhumidity <= 80.0
                  ? "Excellent! Maintain regular watering and cultivation practices."
                  : "Using fans, exhaust systems, or dehumidifiers can help control humidity levels.";

      temperatureSuggestion = airtemp <= 20
          ? "Consider planting cold-tolerant varieties or using techniques like raised beds."
          : airtemp > 20 && airtemp < 25.0
              ? "Great! Continue regular cultivation practices."
              : airtemp >= 25.0 && airtemp <= 30.0
                  ? "Increasing air circulation and implementing proper irrigation practices."
                  : " Take immediate action: Use evaporative cooling methods and increasing irrigation frequency.";

      soilMoistureSuggestion = soilmoisture <= 20.0
          ? "Use drip irrigating and sprinklers to ensure even distribution of water. Mulching the soil can also help retain moisture."
          : soilmoisture >= 21.0 && soilmoisture <= 40.0
              ? "Great! Monitoring the soil moisture regularly is important to prevent it from becoming too dry or too wet."
              : soilmoisture >= 41.0 && soilmoisture <= 60.0
                  ? "Excellent! Continue regular watering practices appropriate for vegetables."
                  : soilmoisture >= 61.0 && soilmoisture <= 80.0
                      ? "Be cautious not to overwater the soil and risk waterlogging."
                      : "Consider implementing drainage systems, such as installing tiles or ditches,creating raised beds or mounding soil to remove excess water from the soil";
      return GestureDetector(
        onTap: () => notification(
          notificationMessage,
          "Suggestions:\n$humiditySuggestion\n$temperatureSuggestion\n$soilMoistureSuggestion",
        ),
        child: Center(
          child: Container(
            constraints: const BoxConstraints(minWidth: 350.0),
            padding: const EdgeInsets.only(
                top: 30.0, left: 30.0, bottom: 30.0, right: 25.0),
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(Icons.add_circle, size: 50.0, color: AppColors.darkBrown),
                SizedBox(height: 20.0),
                PrimaryText(text: 'Add a sensor!')
              ],
            ),
          ),
        ),
      );
    } else {
      return Center(
        child: Container(
          constraints: const BoxConstraints(minWidth: 370.0),
          padding: const EdgeInsets.only(
              top: 30.0, left: 30.0, bottom: 30.0, right: 25.0),
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(30.0),
          ),
          child: const Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(Icons.add_circle, size: 50.0, color: AppColors.darkBrown),
              SizedBox(height: 20.0),
              PrimaryText(text: 'Add a sensor!')
            ],
          ),
        ),
      );
    }
  }
}
