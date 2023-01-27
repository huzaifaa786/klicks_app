import 'package:klicks_app/api/api.dart';
import 'package:klicks_app/values/string.dart';

class CityApi {
 static getall() async {
  

    var url = BASE_URL + 'city/all';

    var data = {};

    var response = await Api.execute(url: url, data: data);
    

   
  }
}
