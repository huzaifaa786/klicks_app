import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';

class Api {
  static execute({url, data}) async {
    var result;

    Dio dio = Dio();
    print(url);
    print(data);

    result = await dio.post(url, data: data);

    print(result);
    var response = jsonDecode(result.toString());

    return response;
  }
}
