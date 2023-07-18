import 'dart:convert';
import 'package:first_app/model/weather_data.dart';
import 'package:first_app/model/current_weather_data.dart';
import 'package:first_app/model/hourly_weather_data.dart';
import 'package:first_app/model/daily_weather_data.dart';
import 'package:http/http.dart' as http;
import 'weather_api.dart';

class FetchData {
  WeatherData? weatherData;

  // processing the data from response to json request
  Future<WeatherData> getData(lat, lon) async {
    var response = await http.get(Uri.parse(apiURL(lat, lon)));
    var jsonString = jsonDecode(response.body);
    weatherData = WeatherData(
        WeatherDataCurrent.fromJson(jsonString),
        WeatherDataHourly.fromJson(jsonString),
        WeatherDataDaily.fromJson(jsonString));
    return weatherData!;
  }
}

String apiURL(lat, lon) {
  String url;
  url =
      "https://api.openweathermap.org/data/3.0/onecall?lat=$lat&lon=$lon&appid=$apiKey&exclude=minutely&units=metric";
  //https://api.openweathermap.org/data/3.0/onecall?lat=5.2704&lon=100.4197&appid=f03d10b54ac96a6edd8c6ea204f9f6eb&exclude=minutely&units=metric
  //"https://api.openweathermap.org/data/3.0/onecall?lat=$lat&lon=$lon&appid=$apiKey&exclude=minutely&units=metric";
  return url;
}
