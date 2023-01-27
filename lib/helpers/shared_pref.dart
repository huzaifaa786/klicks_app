

import 'package:klicks_app/helpers/ram.dart';

import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesHelper {
  static init() async {
    Ram.sharedPreferences = await SharedPreferences.getInstance();
  }

  static String? getString(String key){
    return Ram.sharedPreferences!.getString(key);
  }

  static void setString(String key,String value){
    Ram.sharedPreferences!.setString(key, value);
  }
  
  static void remove(String key){
    Ram.sharedPreferences!.remove(key);
  }

  
}