import 'package:first_app/style/colours.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:first_app/pages/dashboard/sensor/sensor_provider.dart';

class SensorHeader extends StatefulWidget {
  const SensorHeader({super.key});

  @override
  State<SensorHeader> createState() => _SensorHeaderState();
}

class _SensorHeaderState extends State<SensorHeader> {
  @override
  Widget build(BuildContext context) {
    final sensorDataProvider = Provider.of<SensorDataProvider>(context);
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Image.asset('images/icons/sensordate.png', height: 50.0, width: 50.0),
        const SizedBox(width: 20),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              sensorDataProvider.date,
              style: const TextStyle(
                fontSize: 27,
                fontWeight: FontWeight.w800,
                color: AppColors.darkBrown,
                fontFamily: 'Poppins',
              ),
            ),
            Text(
              sensorDataProvider.time,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w400,
                color: AppColors.brown,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
