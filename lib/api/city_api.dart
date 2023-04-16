import 'package:fluttertoast/fluttertoast.dart';
import 'package:klicks_app/api/api.dart';
import 'package:klicks_app/helpers/loading.dart';
import 'package:klicks_app/model/City.dart';
import 'package:klicks_app/model/Mall.dart';
import 'package:klicks_app/model/company.dart';
import 'package:klicks_app/model/services.dart';
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
  
    static getcompanywithmall(id) async {
    LoadingHelper.show();

    var url = BASE_URL + 'company/mall';

    var data = {'company_id': id};

    var response = await Api.execute(url: url, data: data);
    if(response['error']){
      Fluttertoast.showToast(msg: response['error_data']);
    }
    LoadingHelper.dismiss();
    Company? company;
    Mall? mall;
    City? city;
    company = Company(response['company']);
    mall = Mall(response['company']['mall']);
    city = City(response['company']['mall']['city']);
    
    return [mall,company,city];
  }

  static getservice(id) async {
    LoadingHelper.show();
    var url = BASE_URL + 'allservices';
    var data;

    data = {'id': id};
    print(data);
    var response = await Api.execute(
      url: url,
      data: data,
    );
    print(response);
    LoadingHelper.dismiss();
    List<ExtraService> extraservices = <ExtraService>[];
    for (var extraservice in response['services']) {
      extraservices.add(ExtraService(extraservice));
    }
    return extraservices;
  }
}
