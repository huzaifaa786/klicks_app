import 'package:fluttertoast/fluttertoast.dart';
import 'package:klicks_app/api/api.dart';
import 'package:klicks_app/helpers/loading.dart';
import 'package:klicks_app/model/notification.dart';
import 'package:klicks_app/values/string.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NotificationApi {
  static getnotifications() async {
    LoadingHelper.show();
    var url = BASE_URL + 'usernotfion';
    var data;
    final prefs = await SharedPreferences.getInstance();
    data = {'id': prefs.getString('user_id')!};

    var response = await Api.execute(url: url, data: data);
    print(response);
    LoadingHelper.dismiss();
    if (!response['error']) {
      List<NotificationModal> notifications = <NotificationModal>[];
      for (var notification in response['notification']) {
        print(response['notification']);
        notifications.add(NotificationModal(notification));
      }
      return notifications;
    } else {
      Fluttertoast.showToast(msg: response['error_data']);
      return false;
    }
  }
}