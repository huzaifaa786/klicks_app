import 'package:fluttertoast/fluttertoast.dart';
import 'package:klicks_app/api/api.dart';
import 'package:klicks_app/helpers/loading.dart';
import 'package:klicks_app/helpers/shared_pref.dart';
import 'package:klicks_app/model/Account.dart';
import 'package:klicks_app/model/City.dart';
import 'package:klicks_app/values/string.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StripeApi {
  static paymentIntent(price) async {
    var url = BASE_URL + 'createpaymentIntent';
    var data = {'price': price};
    var response = await Api.execute(url: url, data: data);
    print(response);

    return response['intent'];
  }

  static balance() async {
    LoadingHelper.show();

    var url = BASE_URL + 'balanceshow';
    var data;
    final prefs = await SharedPreferences.getInstance();
    data = {
      'id': prefs.getString('user_id'),
    };

    var response = await Api.execute(
      url: url,
      data: data,
    );
    print(response);
    LoadingHelper.dismiss();
    Account account = Account(response['account']);
    return account;
  }

  static addbalance(Selectedvalue) async {
    LoadingHelper.show();

    var url = BASE_URL + 'balanceadd';
    var data;
    final prefs = await SharedPreferences.getInstance();
    data = {
      'balance': int.parse(Selectedvalue),
      'id': prefs.getString('user_id'),
    };

    var response = await Api.execute(
      url: url,
      data: data,
    );
    print(response);
    LoadingHelper.dismiss();
    Account account = Account(response['account']);
    return account;
  }

  static subtract(price) async {
    LoadingHelper.show();

    var url = BASE_URL + 'balancesubtract';
    var data;
    final prefs = await SharedPreferences.getInstance();
    data = {
      'balance': int.parse(price),
      'id': prefs.getString('user_id'),
    };

    var response = await Api.execute(
      url: url,
      data: data,
    );
    print(response);
    LoadingHelper.dismiss();
    Account account = Account(response['account']);
    return account;
  }
}
