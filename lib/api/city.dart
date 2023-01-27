import 'package:klicks_app/api/api.dart';
import 'package:klicks_app/values/string.dart';

class CityApi {
  static login(city, mall) async {
    var url = BASE_URL + 'city';
    var data = {'city': city.text, 'mall': mall.text};
    var response = await Api.execute(url: url, data: data);
  }
}
