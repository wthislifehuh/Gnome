// import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';

class SensorDataProvider extends ChangeNotifier {
  double airHumidity = 0.0;
  double airTemperature = 0.0;
  double soilMoisture = 0.0;
  double riskscore = 0.0;
  String date = "00/00/0000";
  String time = "00:00:00";

  void updateSensorData(double newHumidity, double newTemperature,
      double newMoisture, double newRiskscore, String newDate, String newTime) {
    airHumidity = newHumidity;
    airTemperature = newTemperature;
    soilMoisture = newMoisture;
    riskscore = newRiskscore;
    date = newDate;
    time = newTime;

    WidgetsBinding.instance.addPostFrameCallback((_) {
      notifyListeners();
    });
  }
}
