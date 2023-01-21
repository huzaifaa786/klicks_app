import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:klicks_app/helpers/url.dart';

class Api{
 static execute({url, data}) async {
    print("called");
    var result;

    // log('TRITECAPI Url : ' + url.toString());
    // print('TRITECAPI Data : ' + data.toString());
    Dio dio = Dio();
    // dio.options.headers['Content-Type'] = 'multipart/form-data';
    print('TRITECAPI TestUrl : ' + url + URL.toGetString(data));
    print(data);
    result = await dio.post(url,data: data,);
    var response = jsonDecode(result.toString());
    // // print('TRITECAPI Result : ' + result.toString());
    return response;
  }


}