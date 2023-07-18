import 'package:get/get.dart';
import 'package:geolocator/geolocator.dart';
import 'package:first_app/api/fetch_data.dart';
//import 'package:first_app/model/current_weather_data.dart';
import 'package:first_app/model/weather_data.dart';

class GlobalController extends GetxController {
  final RxBool _isLoading = true.obs;
  final RxDouble _latitude = 0.0.obs;
  final RxDouble _longitude = 0.0.obs;
  final RxInt cardIndex = 0.obs;
  final weatherData = WeatherData().obs;

  RxBool checkLoading() => _isLoading;
  RxDouble getLatitude() => _latitude;
  RxDouble getLongitude() => _longitude;
  WeatherData getWeatherData() => weatherData.value;

  @override
  void onInit() {
    if (_isLoading.isTrue) {
      getLocation();
    } else {
      getIndex();
    }
    super.onInit();
  }

  RxInt getIndex() => cardIndex;
  getLocation() async {
    bool isEnabled = await Geolocator.isLocationServiceEnabled();
    if (!isEnabled) return Future.error('Service is not enabled');

    LocationPermission locationP = await Geolocator.checkPermission();
    if (locationP == LocationPermission.deniedForever) {
      Future.error('Service denied forever');
    } else if (locationP == LocationPermission.denied) {
      locationP = await Geolocator.requestPermission();
      if (locationP == LocationPermission.denied) {
        Future.error('Service denied');
      }
    }

    return await Geolocator.getCurrentPosition(
            desiredAccuracy: LocationAccuracy.high)
        .then((value) {
      _latitude.value = value.latitude;
      _longitude.value = value.longitude;

      return FetchData()
          .getData(_latitude.value, _longitude.value)
          .then((value) {
        weatherData.value = value;
        _isLoading.value = false;
      });
    });
  }
}
