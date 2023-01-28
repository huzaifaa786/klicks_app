import 'package:klicks_app/api/api.dart';
import 'package:klicks_app/values/string.dart';

class CityApi {
  static getall() async {
    var url = BASE_URL + 'city/all';

    var response = await Api.execute(url: url);

    print(response);
  }

  static getmall(id) async {
    var url = BASE_URL + 'get/mall';

    var data = {'city_id': id};

    var response = await Api.execute(url: url, data: data);
  }
}
