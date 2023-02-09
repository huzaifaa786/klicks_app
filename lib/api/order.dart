import 'package:klicks_app/api/api.dart';
import 'package:klicks_app/helpers/auth.dart';
import 'package:klicks_app/helpers/loading.dart';
import 'package:klicks_app/static/order.dart';
import 'package:klicks_app/values/string.dart';

class OrderApi {
  static get() async {
    LoadingHelper.show();

    var url = BASE_URL + 'order';

    var data = {};

    var response = await Api.execute(url: url, data: data);
    LoadingHelper.dismiss();

    // if (!response['error']) {
    //   List<Order> orders = <Order>[];
    //   for (var order in response['orders']) {
    //     orders.add(Order(order));
    //   }
    //   return orders;
    // } else {
    //   return Order(response['order']);
    // }
  }
}
