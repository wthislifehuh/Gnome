import 'package:first_app/pages/dashboard/sensor/realtime.dart';
import 'package:first_app/pages/dashboard/sensor/widget/add_sensor.dart';
import 'package:first_app/style/colours.dart';
import 'package:flutter/material.dart';
import 'package:first_app/pages/dashboard/sensor/widget/dht11.dart';
import 'package:first_app/pages/dashboard/sensor/widget/risk_score.dart';
import 'package:first_app/pages/dashboard/sensor/widget/sensor_header.dart';
import 'package:first_app/pages/dashboard/sensor/widget/soil_moisture.dart';
import 'package:first_app/function/size_config.dart';

//import 'package:first_app/pages/style/colours.dart';
//import 'package:first_app/pages/style/text.dart';

class SensorPage extends StatefulWidget {
  const SensorPage({super.key});

  @override
  State<SensorPage> createState() => _SensorPageState();
}

class _SensorPageState extends State<SensorPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('𝕊 𝔼 ℕ 𝕊 𝕆 ℝ'),
        backgroundColor: const Color(0xff433831),
        actions: [
          IconButton(
            icon: const Icon(Icons.calendar_month),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () {},
          ),
        ],
      ),
      backgroundColor: const Color.fromARGB(255, 239, 237, 232),
      body: SafeArea(
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: SizedBox(
                height: SizeConfig.screenHeight,
                width: double.infinity,
                child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(
                      vertical: 20.0, horizontal: 20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SensorData(),
                      const SensorHeader(),
                      const SizedBox(height: 10.0),
                      Divider(
                        color: AppColors.grey.withOpacity(0.6),
                        thickness: 1,
                      ),
                      const SizedBox(height: 20.0),
                      SizedBox(
                        height: SizeConfig.blockSizeVertical,
                        width: SizeConfig.screenWidth,
                        child: const Wrap(
                          runSpacing: 20.0,
                          spacing: 20.0,
                          alignment: WrapAlignment.spaceAround,
                          children: [
                            SizedBox(height: 20),
                            RiskScore(),
                            SizedBox(height: 20),
                            SoilMoisture(),
                            DHT11(),
                            AddSensor(),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}



// import 'package:first_app/pages/dashboard/sensor/widget/dht11.dart';
// import 'package:first_app/pages/dashboard/sensor/widget/risk_score.dart';
// import 'package:first_app/pages/dashboard/sensor/widget/sensor_header.dart';
// import 'package:first_app/pages/dashboard/sensor/widget/soil_moisture.dart';
// import 'package:first_app/style/colours.dart';
// import 'package:flutter/material.dart';

// class SensorPage extends StatefulWidget {
//   const SensorPage({super.key});

//   @override
//   State<SensorPage> createState() => _SensorPageState();
// }

// class _SensorPageState extends State<SensorPage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('𝕊 𝔼 ℕ 𝕊 𝕆 ℝ'),
//         backgroundColor: const Color(0xff433831),
//       ),
//       body: SafeArea(
//         child: ListView(
//           scrollDirection: Axis.vertical,
//           children: const [
//             SensorHeader(),
//             SizedBox(height: 10.0),
//             Divider(
//               thickness: 1,
//               color: AppColors.lightGrey,
//             ),
//             SizedBox(height: 20.0),
//             RiskScore(),
//             SizedBox(height: 20.0),
//             DHT11(),
//             SizedBox(height: 20.0),
//             SoilMoisture(),
//           ],
//         ),
//       ),
//     );
//   }
// }
