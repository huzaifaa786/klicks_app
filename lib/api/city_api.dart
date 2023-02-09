import 'dart:developer';

import 'package:klicks_app/api/api.dart';
import 'package:klicks_app/model/City.dart';
import 'package:klicks_app/model/Mall.dart';
import 'package:klicks_app/model/company.dart';
import 'package:klicks_app/values/string.dart';

class CityApi {
  static getcities() async {
    var url = BASE_URL + 'city/all';
    var response = await Api.execute(url: url);
    print(response);

    List<City> cities = <City>[];
    for (var city in response['cities']) {
      cities.add(City(city));
    }
    return cities;
  }

  static getmall(id) async {
    var url = BASE_URL + 'city/malls';

    var data = {'city_id': id};

    var response = await Api.execute(url: url, data: data);
    print(response['malls']);
    List<Mall> malls = <Mall>[];
    for (var mall in response['malls']) {
      malls.add(Mall(mall));
    }
    return malls;
  }
   static getcompany(id) async {
    var url = BASE_URL + 'mall/companys';

    var data = {'mall_id': id};

    var response = await Api.execute(url: url, data: data);
    print(response['companys']);
    List<Company> companys = <Company>[];
    for (var company in response['companys']) {
      companys.add(Company(company));
    }
    return companys;
  }
}
