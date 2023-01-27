import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:klicks_app/helpers/url.dart';

class Api {
  static execute({url, data}) async {
    print("called");
    var result;

    Dio dio = Dio();
    print('TestUrl : ' + url + URL.toGetString(data));
    print(url);
    print(data);

    result = await dio.post(
      url,
      data: data,
    );
   
    print(result);
    var response = jsonDecode(result.toString());

    return response;
  }
}
