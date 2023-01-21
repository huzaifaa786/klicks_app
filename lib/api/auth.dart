

import 'package:klicks_app/api/api.dart';
import 'package:klicks_app/values/string.dart';

class AuthApi {
  static login(email, password) async {


    var url = BASE_URL + 'login';
    var data = {'email': email.text, 'password': password.text};
    var response = await Api.execute(url: url, data: data);

    

  }

 

  
}
