import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:klicks_app/helpers/loading.dart';
import 'package:klicks_app/helpers/notification_helper.dart';
import 'package:klicks_app/helpers/notification_services.dart';
import 'package:klicks_app/screen/booking_confirm/booking_confirm.dart';
import 'package:klicks_app/screen/checkout/checkout.dart';
import 'package:klicks_app/screen/edit_profile.dart/edit_profile.dart';
import 'package:klicks_app/screen/forget_password/forget_password.dart';
import 'package:klicks_app/screen/intro/intro.dart';
import 'package:klicks_app/screen/home/navigation_screen.dart';
import 'package:klicks_app/screen/login/login.dart';
import 'package:klicks_app/screen/order_history/order_histary.dart';
import 'package:klicks_app/screen/select_car/select_car.dart';
import 'package:klicks_app/screen/notification/notification.dart';
import 'package:klicks_app/screen/order_status/order_status.dart';
import 'package:klicks_app/screen/profile/profile.dart';
import 'package:klicks_app/screen/signup/signup.dart';
import 'package:klicks_app/screen/splash/splash_screen.dart';
import 'package:klicks_app/screen/top_up/top_up.dart';
import 'package:klicks_app/values/styles.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  // MessagingManager().configure();
  Stripe.publishableKey =
      'pk_test_51MbJfzF8ZlDbtPcpjb2nIwCCQlWgmx71OXCFSg3as9Og4rnEaNPdH3NZtbZlRf6JbJXwQyTmYZBsav7AHyCXimFz00YMBRcimp';
  Stripe.merchantIdentifier = 'merchant.flutter.stripe.test';
  Stripe.urlScheme = 'flutterstripe';
  await Stripe.instance.applySettings();
  runApp(const MyApp());
}

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  update() {
    setState(() {});
  }

  @override
  void initState() {
    LoadingHelper.onChangeAbsorbClick = update;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AbsorbPointer(
      absorbing: LoadingHelper.absorbClick,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        navigatorKey: navigatorKey,
        builder: EasyLoading.init(),
        theme: Styles.lightTheme,
        title: "Klicks",
        initialRoute: 'splash',
        routes: {
          'splash': (context) => const SplashScreen(),
          'login': (context) => const LoginScreen(),
          'home': (context) => const BottomNavScreen(),
          'booking_confirm': (context) => const BookingConfirm(),
          'order_status': (context) => const OrderStatus(),
          'notification': (context) => const NotificationScreen(),
          'profile': (context) => const ProfileScreeen(),
          'order_histary': (context) => const OrderHistry(),
          'top_up': (context) => const TopUp(),
          'edit_profile': (context) => const EditProfile(),
          'intro': (context) => const IntroScreen(),
          'signup': (context) => const SignUp(),
          'forgot_screen': (context) => ForgotScreen(),
        },
      ),
    );
  }
}
