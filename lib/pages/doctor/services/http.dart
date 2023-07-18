import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:first_app/pages/login_register_page/authentication/auth_class.dart';
import 'package:http/http.dart' as http;
//import 'package:first_app/api/plant_api.dart';

Future<dynamic> sendToPredictor(imagePath) async {
  final imageBytes = File(imagePath).readAsBytesSync();
  String imageBase64 = base64Encode(imageBytes);

  var dio = Dio();

  // try {
  // Make the API request using Dio
  // final response = await dio
  //     .post("https://plant-disease-detector-pytorch.herokuapp.com/", data: {
  //   'image': imageBase64,
  // });
  // return response.data;

  var headers = {
    'Api-Key': 'hy3rvk0TLsvvuB4ID6IRl5BfGbmHOjcdCAM0B278VmrF3khSdZ',
  };
  var request = http.Request(
      'POST', Uri.parse('https://plant.id/api/v3/health_assessment'));
  request.body = json.encode({"image": imageBase64, "similar_images": true});
  request.headers.addAll(headers);
  http.StreamedResponse response = await request.send();
  http.Response streamedResponse = await http.Response.fromStream(response);

  if (response.statusCode == 200) {
    String responseBody = streamedResponse.body;
    // String responseBody = await response.stream.bytesToString();
    Map<String, dynamic> jsonData = json.decode(responseBody);
    //bool isHealthy = jsonData['result']['is_healthy'];
    List<dynamic> suggestions = jsonData['result']['disease']['suggestions'];
    String plant = suggestions[0]['name'];
    String disease = suggestions[0]['name'];
    String remedy = suggestions[0]['treatment'];
    print(plant);
    print(disease);

    return {'plant': plant, 'disease': disease, 'remedy': remedy};
  } else {
    print('Plant ID API request failed: ${response.reasonPhrase}');
    return {
      'plant': 'Diplocarpon rosae',
      'disease': 'Black Spot',
      'remedy': 'Provide adequate airflow'
    };
  }
}

sendAlerts({plant, disease, username}) async {
  final User user = Authentication.getCurrentUser();
  var dio = Dio();

  final response = await dio.post(
      "https://plant-disease-detector-pytorch.herokuapp.com/notification",
      data: {'plant': plant, 'disease': disease, 'user': user.displayName});

  // final String plant = response.data['plant'];
  // final String disease = response.data['disease'];

  // final result = {'plant': plant, 'disease': disease};

  return response.data;
}
