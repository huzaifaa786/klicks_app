import 'package:firebase_messaging/firebase_messaging.dart';

class MessagingManager {
  FirebaseMessaging messaging = FirebaseMessaging.instance;

  Future<String?> getToken() async {
    return await messaging.getToken();
  }

  void configure() {
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print(message.toString());
      // NotificationServices.create(message);
    });
  }
}
