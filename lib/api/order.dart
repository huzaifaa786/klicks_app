import 'package:klicks_app/api/api.dart';
import 'package:klicks_app/helpers/auth.dart';
import 'package:klicks_app/helpers/loading.dart';
import 'package:klicks_app/static/order.dart';
import 'package:klicks_app/values/string.dart';

class OrderApi {
  static placeorder(tip, selectedcartype, company_id, floorNumber, id,
      plateNumber, parkingNumber, price, length) async {
    LoadingHelper.show();

    var url = BASE_URL + 'ordersave';

    var data = {
      'tip': tip,
      'cartype': selectedcartype,
      'company_id': company_id,
      'floornumber': floorNumber,
      'mall_id': id,
      'number_plate': plateNumber,
      'parking': parkingNumber,
      'totalpayment': price,
    };

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
