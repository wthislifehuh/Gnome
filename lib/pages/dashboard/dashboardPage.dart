import 'package:first_app/pages/dashboard/crop/crop_dashboard.dart';
import 'package:first_app/pages/dashboard/sensor/realtime.dart';
import 'package:first_app/pages/dashboard/sensor/widget/risk_score.dart';
import 'package:first_app/pages/dashboard/weatherPage/widget/db_header.dart';
import 'package:first_app/pages/dashboard/sensor/sensor_dashboard.dart';
import 'package:first_app/pages/dashboard/weatherPage/weather_dashboard.dart';
import 'package:first_app/function/size_config.dart';
import 'package:first_app/pages/todo/db_todo.dart';
//import 'package:first_app/pages/style/colours.dart';
//import 'package:first_app/pages/style/text.dart';
import 'package:flutter/material.dart';
import 'package:first_app/controller/global_controller.dart';
import 'package:get/get.dart';
import 'package:first_app/pages/dashboard/farm/farm_dashboard.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final GlobalController globalController =
      Get.put(GlobalController(), permanent: true);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('𝔾 ℕ 𝕆 𝕄 𝔼'),
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
      backgroundColor: const Color(0xffF8F7F4),
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
                      const Header(),
                      const SizedBox(
                          height:
                              20.0), //SizedBox(height: SizeConfig.blockSizeVertical! * 4.0),
                      SizedBox(
                        height: SizeConfig.blockSizeVertical,
                        width: SizeConfig.screenWidth,
                        child: const Wrap(
                          runSpacing: 20.0,
                          spacing: 20.0,
                          alignment: WrapAlignment.spaceBetween,
                          children: [
                            SensorData(),
                            WeatherDashboard(),
                            RiskScore(),
                            CropDashboard(),
                            SensorDashboard(),
                            ToDoDashboard(),
                            FarmDashboard(),
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
