import 'package:dio/dio.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:klicks_app/api/api.dart';
import 'package:klicks_app/helpers/loading.dart';
import 'package:klicks_app/helpers/shared_pref.dart';
import 'package:klicks_app/model/User.dart';
import 'package:klicks_app/values/string.dart';

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
      // Auth.login(user);
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
      SharedPreferencesHelper.setString('name', user.name!);

      return true;
    } else {
      print('error');
      Fluttertoast.showToast(msg: response['error_data']);
      return false;
    }
  }
}
