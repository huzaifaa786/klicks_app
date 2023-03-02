import 'package:dio/dio.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:klicks_app/api/api.dart';
import 'package:klicks_app/helpers/loading.dart';
import 'package:klicks_app/helpers/shared_pref.dart';
import 'package:klicks_app/model/User.dart';
import 'package:klicks_app/values/string.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthApi {
  static login(email, password) async {
    LoadingHelper.show();
    var url = BASE_URL + 'login';
    var data = {'email': email.text, 'password': password.text};

    var response = await Api.execute(url: url, data: data);
    print(Response);
    LoadingHelper.dismiss();
    if (!response['error']) {
      User user = User(response['user']);
      SharedPreferencesHelper.setString('api_token', user.apiToken!);
      return true;
    } else {
      Fluttertoast.showToast(msg: response['error_data']);
      return false;
    }
  }

  static register(name, email, phone, password) async {
    LoadingHelper.show();
    var url = BASE_URL + 'register';
    var data;
    data = {
      'name': name.text.toString(),
      'email': email.text.toString(),
      'phone': phone.text.toString(),
      'password': password.text.toString(),
    };

    var response = await Api.execute(
      url: url,
      data: data,
    );
    print(response);
    LoadingHelper.dismiss();
    if (!response['error']) {
      User user = User(response['user']);
      SharedPreferencesHelper.setString('api_token', user.apiToken!);
         SharedPreferencesHelper.setString('user_id', user.id.toString());

      return true;
    } else {
      print('error');
      Fluttertoast.showToast(msg: response['error_data']);
      return false;
    }
  }

   static getuser() async {
    LoadingHelper.show();
    var url = BASE_URL + 'getuser';
    var data;
    final prefs = await SharedPreferences.getInstance();
    print(prefs.getString('api_token'));
    data = {'api_token': prefs.getString('api_token')!};

    var response = await Api.execute(url: url, data: data);
    LoadingHelper.dismiss();
    if (!response['error']) {
      User user = User(response['user']);
      return user;
    } else {
      Fluttertoast.showToast(msg: response['error_data']);
      return false;
    }
  }
}
