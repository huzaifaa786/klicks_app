import 'package:fluttertoast/fluttertoast.dart';
import 'package:klicks_app/api/api.dart';
import 'package:klicks_app/helpers/loading.dart';
import 'package:klicks_app/values/string.dart';

class OrderApi {
  static placeorder(tip, selectedcartype, company_id, floorNumber, id,
      plateNumber, parkingNumber, price, extraService, uid, cityId) async {
    LoadingHelper.show();
    var url = BASE_URL + 'ordersave';
    var data = {
      'tip': tip,
      'cartype': selectedcartype,
      'company_id': company_id,
      'floor': floorNumber,
      'mall_id': id,
      'number_plate': plateNumber,
      'parking': parkingNumber,
      'totalpayment': price,
      'user_id': uid,
      'city_id': cityId,
<<<<<<< HEAD
      'services':extraService
=======
      'services': extraService
>>>>>>> 9c22095cef2d92cf6edb1362b06c9cecc76e862a
    };
    var response = await Api.execute(url: url, data: data);
    LoadingHelper.dismiss();

    if (!response['error']) {
      Fluttertoast.showToast(msg: 'Order created Sucessfully');
      return true;
    } else {
      return false;
    }
  }
}
