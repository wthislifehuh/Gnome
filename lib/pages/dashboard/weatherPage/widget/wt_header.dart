import 'package:flutter/material.dart';
import 'package:get/get.dart';
//import 'package:geocoding/geocoding.dart';
import 'package:first_app/controller/global_controller.dart';
import 'package:first_app/style/colours.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:intl/intl.dart';

class WeatherHeader extends StatefulWidget {
  const WeatherHeader({super.key});

  @override
  State<WeatherHeader> createState() => _WeatherHeaderState();
}

class _WeatherHeaderState extends State<WeatherHeader> {
  String city = "";

  final GlobalController globalController =
      Get.put(GlobalController(), permanent: true);
  //String date = DateTime.now().toString().substring(0, 10);
  String date = DateFormat("yMMMd").format(DateTime.now());

  @override
  void initState() {
    getAddress(globalController.getLatitude().value,
        globalController.getLongitude().value);
    super.initState();
  }

  getAddress(lat, lon) async {
    // List<Placemark> placemark = await placemarkFromCoordinates(lat, lon);
    // Placemark place = placemark[0];
    final url = Uri.parse(
        'https://api.bigdatacloud.net/data/reverse-geocode-client?latitude=$lat&longitude=$lon&localityLanguage=en');
    final response = await http.get(url);
    final data = jsonDecode(response.body);

    if (mounted) {
      setState(() {
        city = '${data["locality"].toString()}, ${data["city"].toString()}';
      });
    }
    // setState(() {
    //   // city = placemark[0].subAdministrativeArea.toString();
    //   city = '${data["locality"].toString()}, ${data["city"].toString()}';
    //    city = "${place.locality}, ${place.country}";
    //   city = place.subLocality!;
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(left: 20, right: 20),
          alignment: Alignment.topLeft,
          child: city.length > 2
              ? Container(
                  margin: const EdgeInsets.only(
                      left: 8, right: 8, bottom: 8, top: 8),
                  alignment: Alignment.topLeft,
                  child: Wrap(
                    alignment: WrapAlignment.spaceAround,
                    children: [
                      const SizedBox(height: 10),
                      Container(
                        alignment: Alignment.topLeft,
                        height: 10,
                        width: 50,
                        child: const Icon(
                          Icons.location_on,
                          color: AppColors.darkBrown,
                          size: 30,
                        ),
                      ),
                      SizedBox(
                        width: 290,
                        child: Text(
                          city,
                          style: const TextStyle(
                            height: 1.2,
                            fontSize: 27,
                            fontWeight: FontWeight.w500,
                            color: AppColors.black,
                            fontFamily: 'Poppins',
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              : Row(
                  children: [
                    Container(
                      alignment: Alignment.topLeft,
                      height: 10,
                      width: 50,
                      child: const Icon(
                        Icons.location_on,
                        color: AppColors.darkBrown,
                        size: 30,
                      ),
                    ),
                    const Text(
                      'Getting the name of your city...',
                      style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          height: 2),
                    ),
                  ],
                ),
        ),
        Container(
          margin: const EdgeInsets.only(left: 80, right: 30, bottom: 10),
          alignment: Alignment.topLeft,
          child: Text(
            date,
            style: const TextStyle(
                height: 1.5,
                fontSize: 17,
                color: Colors.grey,
                fontWeight: FontWeight.w500,
                fontFamily: 'Poppins'),
          ),
        ),
      ],
    );
  }
}
