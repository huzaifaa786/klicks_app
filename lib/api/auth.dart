import 'package:dio/dio.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:klicks_app/api/api.dart';
import 'package:klicks_app/helpers/loading.dart';
import 'package:klicks_app/helpers/shared_pref.dart';
import 'package:klicks_app/model/Order.dart';
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
      SharedPreferencesHelper.setString('user_id', user.id.toString());

      return true;
    } else {
      Fluttertoast.showToast(msg: response['error_data']);
      return false;
    }
  }

  static register(name, email, phone, password) async {
    LoadingHelper.show();
       var token = await FirebaseMessaging.instance.getToken();
    var url = BASE_URL + 'register';
    var data;
    data = {
      'name': name.text.toString(),
      'email': email.text.toString(),
      'phone': phone.text.toString(),
      'password': password.text.toString(),
      'firebase_token': token,
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

  static getorder() async {
    LoadingHelper.show();
    var url = BASE_URL + 'getuserorder';
    var data;
    final prefs = await SharedPreferences.getInstance();
    print('object');
    print(prefs.getString('user_id'));
    data = {'id': prefs.getString('user_id')!};

    var response = await Api.execute(url: url, data: data);
    LoadingHelper.dismiss();
    if (!response['error']) {
      List<OrderModal> orders = <OrderModal>[];
      for (var order in response['orders']) {
        orders.add(OrderModal(order));
      }
      return orders;
    } else {
      Fluttertoast.showToast(msg: response['error_data']);
      return false;
    }
  }

  static Future logout() async {
    SharedPreferencesHelper.remove('api_token');
    SharedPreferencesHelper.remove('user_id');
  }

  static changeposward(String email, password, newPassword) async {
    LoadingHelper.show();
    var url = BASE_URL + 'changepasworduser';
    var data;
    data = {
      'email': email,
      'password': password.text,
      'newpassword': newPassword.text
    };

    var response = await Api.execute(url: url, data: data);

    LoadingHelper.dismiss();
    if (response['error'] == false) {
      User user = User(response['update']);
      Fluttertoast.showToast(msg: 'Password update successfully');
      return user;
    } else {
      Fluttertoast.showToast(msg: response['error']);
      return false;
    }
    // return response;
  }

  static getuserUsingEmail(email) async {
    LoadingHelper.show();
    var url = BASE_URL + 'forgetuserpassword';
    var data = {'email': email};

    var response = await Api.execute(url: url, data: data);
    LoadingHelper.dismiss();
    if (!response['error']) {
      return response['otp'];
    } else {
      Fluttertoast.showToast(msg: response['error_data']);
      return false;
    }
  }

  static forget(email, password) async {
    LoadingHelper.show();
    var url = BASE_URL + 'forgetchangepassword';
    var data = {'email': email, 'password': password};
    var response = await Api.execute(url: url, data: data);

    LoadingHelper.dismiss();
    return response;
  }
}
