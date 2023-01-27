import 'package:klicks_app/model/User.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
class Ram {
  static late User user;
  static SharedPreferences? sharedPreferences;
  static RouteObserver<PageRoute>? routeObserver;
}