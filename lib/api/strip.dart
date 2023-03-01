import 'package:klicks_app/api/api.dart';
import 'package:klicks_app/model/City.dart';
import 'package:klicks_app/values/string.dart';

class StripeApi {
  static paymentIntent(price) async {
    var url = BASE_URL + 'createpaymentIntent';
    var data = {'price': price };
    var response = await Api.execute(url: url, data: data);
    print(response);

     return response['intent'];
    }
   
  }

