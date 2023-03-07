import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationServices {
  static final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  static void initialize() async {
    InitializationSettings initializationSettings = InitializationSettings(
        android: AndroidInitializationSettings('facebook'));

    flutterLocalNotificationsPlugin.initialize(initializationSettings);
  }

  static void create(RemoteMessage msg) async {
    NotificationDetails notificationDetails = NotificationDetails(
        android: AndroidNotificationDetails('channel id', 'channel name',
            priority: Priority.high, importance: Importance.max));
    await flutterLocalNotificationsPlugin.show(
        0, msg.notification!.title, msg.notification!.body, notificationDetails,
        payload: msg.data.toString());
  }
}
