import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:klicks_app/helpers/notification_helper.dart';
import 'package:klicks_app/helpers/notification_stream.dart';
import 'package:klicks_app/helpers/ring_helper.dart';
import 'package:klicks_app/main.dart';

class FirebaseHelper {
  static init() async {
    await Firebase.initializeApp();

    WidgetsFlutterBinding.ensureInitialized();

    await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );

    FirebaseMessaging.onBackgroundMessage(handleBackgroundNotification);

    FirebaseMessaging.onMessage.listen(handleForegroundNotification);

    FirebaseMessaging.onMessageOpenedApp.listen(handleAppOpened);
  }

  // Static Helper Methods
  static Future<void> handleBackgroundNotification(RemoteMessage message) async {
    RingHelper.ringOnce();
  }

  static handleForegroundNotification(RemoteMessage message) async {
    if (message.notification != null && message.notification!.android!= null) {
      NotificationHelper.showAndroidDefault(message);
    } else {
      NotificationStream.send(message);
    }
  }

  static handleAppOpened(RemoteMessage message) {
    RingHelper.stop();
      //  Navigator.of(navigatorKey.currentContext)
      //     .pushAndRemoveUntil(MaterialPageRoute(builder: (context) => OrderScreen()), ModalRoute.withName("home"));
  }
}
