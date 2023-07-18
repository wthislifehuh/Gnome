// import 'dart:convert';

import 'package:first_app/style/colours.dart';
import 'package:flutter/material.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';

class NotificationHandler extends StatefulWidget {
  Widget child;
  NotificationHandler({super.key, required this.child});
  @override
  State<NotificationHandler> createState() => _NotificationHandlerState();
}

class _NotificationHandlerState extends State<NotificationHandler> {
  final FirebaseMessaging _fcm = FirebaseMessaging.instance;

  @override
  void initState() {
    _fcm.subscribeToTopic('𝔾 ℕ 𝕆 𝕄 𝔼'); //susya
    // _fcm.
    //   onMessage.listen( message) async {
    //     print("onMessage: $message");
    //     showDialog(
    //       context: context,
    //       builder: (context) => AlertDialog(
    //         content: ListTile(
    //           title: Text(message['notification']['title']),
    //           subtitle: Text(message['notification']['body']),
    //         ),
    //         actions: <Widget>[
    //           FlatButton(
    //             child: Text('Ok'),
    //             onPressed: () => Navigator.of(context).pop(),
    //           ),
    //         ],
    //       ))
    //   },
    //   )
    //   onLaunch: (Map<String, dynamic> message) async {
    //     print("onLaunch: $message");
    //     Navigator.push(
    //         context, MaterialPageRoute(builder: (context) => View(false)));
    //   },
    //   onResume: (Map<String, dynamic> message) async {
    //     print("onResume: $message");
    //   },
    // );
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print('Got a message whilst in the foreground!');
      var msg = message.data['body'] ?? ' ';

      Get.snackbar('𝔾ℕ𝕆𝕄𝔼 Alerts', msg,
          duration: const Duration(seconds: 2),
          backgroundColor: AppColors.lightBrown);

      if (message.notification != null) {
        print('Message also contained a notification: ${message.notification}');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
