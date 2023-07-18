import 'current_weather_data.dart';
import 'daily_weather_data.dart';
import 'hourly_weather_data.dart';

class WeatherData {
  WeatherDataCurrent? current;
  WeatherDataHourly? hourly;
  WeatherDataDaily? daily;
  WeatherData([this.current, this.hourly, this.daily]);

  WeatherDataCurrent weatherDataCurrent() => current!;
  WeatherDataHourly weatherDataHourly() => hourly!;
  WeatherDataDaily weatherDataDaily() => daily!;
}
