import 'dart:async';

import 'package:firebase_messaging/firebase_messaging.dart';

class NotificationStream {
  static StreamController<RemoteMessage> instance = StreamController<RemoteMessage>.broadcast();
  static int count = 0;

  static send(RemoteMessage message) {
      instance.add(message);
  }

  static getInstance() {
    return instance.stream;
  }
}