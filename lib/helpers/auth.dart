// import 'package:klicks_app/model/User.dart';

// class Auth {
  // static User user() {
  //   return Ram.user;
  // }

  // static Future login(User user) async {
  //   Ram.user = user;
  //   Auth.save();
  // }

  // static Future save() async {
  //   SharedPreferencesHelper.setString('apiToken', Ram.user.apiToken);
  // }

  // static check() async {
  //   String apiToken = SharedPreferencesHelper.getString('apiToken');
  //   if (apiToken == null) return false;
  //   return await AuthApi.secretLogin(apiToken);
  // }

  // static Future logout() async {
  //   AuthApi.logout();
  //   SharedPreferencesHelper.remove('apiToken');
  //   Navigator.pushNamedAndRemoveUntil(navigatorKey.currentContext, "login", ModalRoute.withName('splash'));
  // }
// }