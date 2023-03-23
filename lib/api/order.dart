import 'package:klicks_app/api/api.dart';
import 'package:klicks_app/helpers/loading.dart';
import 'package:klicks_app/model/extra_services_detail.dart';
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
      'totalpayment': price.toString(),
      'user_id': uid,
      'city_id': cityId,
      'services': extraService
    };
    var response = await Api.execute(url: url, data: data);
    LoadingHelper.dismiss();

    if (!response['error']) {
      return true;
    } else {
      return false;
    }
  }

  static ExtraServicesINOrder(id) async {
    LoadingHelper.show();
    var url = BASE_URL + 'orderdetail';
    var data;

    data = {'id': id};
    print(data);
    var response = await Api.execute(
      url: url,
      data: data,
    );
    print(response);
    LoadingHelper.dismiss();
    List<ExtraServiceDetail> extraservices = <ExtraServiceDetail>[];
    for (var extraservice in response['orders']) {
      extraservices.add(ExtraServiceDetail(extraservice));
    }
    return extraservices;
  }
}
