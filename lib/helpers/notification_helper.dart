import 'dart:js';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:klicks_app/helpers/ring_helper.dart';
import 'package:klicks_app/main.dart';
import 'package:klicks_app/values/colors.dart';

class NotificationHelper {
  static showAndroidDefault(message) async {
    const AndroidNotificationChannel channel = AndroidNotificationChannel(
      'high_importance_channel', // id
      'High Importance Notifications', // title // description
      importance: Importance.high,
    );

    final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

    await flutterLocalNotificationsPlugin.resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>()?.createNotificationChannel(channel);

    var initializationSettingsAndroid = AndroidInitializationSettings('flutter_devs');

    // var initializationSettingsIOs = IOSInitializationSettings();

    var initSetttings = InitializationSettings(android: initializationSettingsAndroid);

    onSelectNotification(String payload) {
  //  Navigator.push(context,
  //             MaterialPageRoute(builder: (context) => ()));
    }

    // flutterLocalNotificationsPlugin.initialize(initSetttings, onSelectNotification: onSelectNotification());

    RemoteNotification notification = message.notification;
    AndroidNotification android = message.notification?.android;
    if (notification != null && android != null) {
      flutterLocalNotificationsPlugin.show(
        0,
        notification.title,
        notification.body,
        NotificationDetails(
          android: AndroidNotificationDetails(
            channel.id,
            channel.name,
            icon: 'logo',
            importance: Importance.max,
            priority: Priority.high,
          ),
        ),
      );

      RingHelper.ringOnce();
    }
  }

  static showCustom(message) async {
    RemoteNotification notification = message.notification;
    AndroidNotification android = message.notification?.android;
    if (notification != null && android != null) {
      RingHelper.start();
      // await showDialog(
      //   context: context,
      //   barrierDismissible: false,
      //   builder: (BuildContext context) {
      //     return NotificationlModal(
      //       message: message,
      //     );
      //   },
      // );
    }
  }
}

class NotificationlModal extends StatelessWidget {
  const NotificationlModal({Key? key, required this.message}) : super(key: key);

  final RemoteMessage message;

  checkNow(context) {
    RingHelper.stop();
    // if (message.notification.body == Strings.NEW_PASSENGER_ORDER) {
    //   Navigator.of(context).pushNamedAndRemoveUntil("passenger", ModalRoute.withName("home"));
    // } else if (message.notification.body == Strings.NEW_FOOD_ORDER) {
    //   Navigator.of(context).pushNamedAndRemoveUntil("food", ModalRoute.withName("home"));
    // }else if (message.notification.body == Strings.NEW_PARCEL_ORDER) {
    //   Navigator.of(context).pushNamedAndRemoveUntil("parcel", ModalRoute.withName("home"));
    // } else {
    //   Navigator.of(context).pop(false);
    // }
  }

  ignore(context) {
    RingHelper.stop();
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: contentBox(context),
    );
  }

  contentBox(context) {
    var px = MediaQuery.of(context).size.width * 0.05;
    var pt = MediaQuery.of(context).size.height * 0.25;
    var pb = MediaQuery.of(context).size.height * 0.50;
    return Container(
      padding: EdgeInsets.only(top: 20, bottom: 15, left: 20, right: 20),
      margin: EdgeInsets.only(top: pt, left: px, right: px, bottom: pb),
      decoration: BoxDecoration(shape: BoxShape.rectangle, color: Colors.white, borderRadius: BorderRadius.circular(20), boxShadow: [
        BoxShadow(color: Colors.black, offset: Offset(0, 10), blurRadius: 10),
      ]),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(
            message.notification!.title!,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: mainColor,
              fontWeight: FontWeight.normal,
              fontSize: 13,
            ),
          ),
          Text(
            message.notification!.body!,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: mainColor,
              fontWeight: FontWeight.normal,
              fontSize: 13,
            ),
          ),
          SizedBox(
            height: 35,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // button(context, checkNow, 'Check Now', MAIN_COLOR),
              SizedBox(
                width: 10,
              ),
              // button(context, checkNow, 'Ignore', RED),
            ],
          ),
        ],
      ),
    );
  }
}
