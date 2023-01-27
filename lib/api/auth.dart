import 'package:klicks_app/api/api.dart';
import 'package:klicks_app/values/string.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class AuthApi {
  static login(email, password) async {
    var url = BASE_URL + 'login';
    var data = {'email': email.text, 'password': password.text};
    var response = await Api.execute(url: url, data: data);
  }

  static register(name, email, phone, password, cpassword) async {
    // LoadingHelper.show();
    var url = BASE_URL + 'register';
    var data;
    data = {
      'name': name.text.toString(),
      'email': email.text.toString(),
      'phone': phone.text.toString(),
      'password': password.text.toString(),
      // 'password_confirmation': cpassword.text.toString(),
    };

    var response = await Api.execute(
      url: url,
      data: data,
    );
     print('hfgh');
    print(response);
    // LoadingHelper.dismiss();
    // if (!response['error']) {
    //   User user = User(response['user']);
    //   Auth.login(user);
    //   // print(response);
    //   return true;
    // } else {
    //   Fluttertoast.showToast(msg: response['error_data']);
    //   return null;
    // }
  }
}
