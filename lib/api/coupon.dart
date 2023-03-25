import 'package:fluttertoast/fluttertoast.dart';
import 'package:klicks_app/api/api.dart';
import 'package:klicks_app/helpers/loading.dart';
import 'package:klicks_app/model/Coupon.dart';
import 'package:klicks_app/values/string.dart';

class CouponApi {
  static ValidateCoupon(company_id, coupon) async {
    LoadingHelper.show();
    var url = BASE_URL + 'getcoupon';
    var data = {'company_id': company_id, 'coupon': coupon.toString()};

    var response = await Api.execute(url: url, data: data);
    LoadingHelper.dismiss();
    if (!response['error']) {
      Coupon? coupon = Coupon(response['coupon']);
      print(coupon);
      return coupon;
    } else {
      Fluttertoast.showToast(msg: response['error_data']);
      return false;
    }
  }
}