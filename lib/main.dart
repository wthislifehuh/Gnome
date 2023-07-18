import 'package:first_app/pages/home_page/introduction.dart';
import 'package:flutter/material.dart';
import 'package:first_app/pages/login_register_page/widget_tree.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'package:first_app/pages/dashboard/sensor/sensor_provider.dart';
import 'package:awesome_notifications/awesome_notifications.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await Hive.initFlutter();
  // open a box
  await Hive.openBox('mybox');

  final prefs = await SharedPreferences.getInstance();
  final showLogin = prefs.getBool('showLogin') ?? false;

  await AwesomeNotifications().initialize(
      // set the icon to null if you want to use the default app icon
      null,
      [
        NotificationChannel(
          channelGroupKey: 'basic_channel_group',
          channelKey: 'basic_channel',
          channelName: 'Basic notifications',
          channelDescription: 'Notification channel for basic tests',
          // defaultColor: AppColors.darkBrown,
          // ledColor: Colors.white
        )
      ],
      debug: true);

  runApp(MultiProvider(providers: [
    ChangeNotifierProvider<SensorDataProvider>(
      create: (_) => SensorDataProvider(),
    ),
  ], child: Gnome(showLogin: showLogin)));
}

class Gnome extends StatefulWidget {
  final bool showLogin;

  const Gnome({required this.showLogin, Key? key}) : super(key: key);

  @override
  State<Gnome> createState() => _GnomeState();
}

class _GnomeState extends State<Gnome> {
  final bool introPageState = false;

  @override
  void initState() {
    AwesomeNotifications().isNotificationAllowed().then((isAllowed) {
      if (!isAllowed) {
        AwesomeNotifications().requestPermissionToSendNotifications();
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.brown,
        ),
        home: widget.showLogin ? const WidgetTree() : const IntroPage());
  }
}
