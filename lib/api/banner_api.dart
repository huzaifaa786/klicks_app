import 'package:fluttertoast/fluttertoast.dart';
import 'package:klicks_app/api/api.dart';
import 'package:klicks_app/helpers/loading.dart';
import 'package:klicks_app/model/Banner.dart';
import 'package:klicks_app/values/string.dart';

class BannerApi {
  static sliderImages() async {
    LoadingHelper.show();
    var url = BASE_URL + 'slider/images';
    var response = await Api.execute(url: url);
    LoadingHelper.dismiss();
    if (!response['error']) {
      List<BannerModal> banner = <BannerModal>[];
      for (var banners in response['images']) {
        banner.add(BannerModal(banners));
      }
      return banner;
      // BannerModal? banner = BannerModal(response['images']);
      // print(banner);
      // return banner;
    } else {
      Fluttertoast.showToast(msg: response['error_data']);
      return false;
    }
  }
}
