import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';
import 'package:first_app/pages/dashboard/sensor/sensor_provider.dart';

class SensorData extends StatefulWidget {
  const SensorData({super.key});

  @override
  State<SensorData> createState() => _SensorDataState();
}

class _SensorDataState extends State<SensorData> {
  final currentUser = FirebaseAuth.instance.currentUser!;
  final sensorData = FirebaseFirestore.instance.collection("Sensor Data");
  // final Stream<QuerySnapshot> usersStream = FirebaseFirestore.instance.collection('Sensor Data').snapshots();
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<DocumentSnapshot>(
      stream: FirebaseFirestore.instance
          .collection("Sensor Data")
          .doc(currentUser.email)
          .snapshots(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        //get user data
        if (snapshot.hasData) {
          final sensorData = snapshot.data!.data() as Map<String, dynamic>?;

          if (sensorData != null) {
            final sensorDataProvider =
                Provider.of<SensorDataProvider>(context, listen: false);
            sensorDataProvider.updateSensorData(
              sensorData['Air Humidity'].toDouble(),
              sensorData['Air Temperature'].toDouble(),
              sensorData['Soil Moisture'].toDouble(),
              sensorData['Risk Score'].toDouble(),
              sensorData['Date'],
              sensorData['Time'],
            );
          }
          ;
        } else if (snapshot.hasError) {
          return Center(
            child: Text('Error : ${snapshot.error}'),
          );
        }
        return const SizedBox(height: 1.0);
      },
    );
  }
}
