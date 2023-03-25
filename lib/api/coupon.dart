import 'package:klicks_app/api/api.dart';
import 'package:klicks_app/model/Coupon.dart';
import 'package:klicks_app/values/string.dart';

class CouponApi{
 static getcoupon(company_id) async {

    var url = BASE_URL + 'getcoupon';
        var data = {'company_id': company_id};

    var response = await Api.execute(url: url, data: data);
   
    print(response);

    List<Coupon> coupons = <Coupon>[];
    for (var coupon in response['coupons']) {
      coupons.add(Coupon(coupon));
    }
    return coupons;
  }








}