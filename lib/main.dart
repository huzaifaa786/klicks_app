import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:klicks_app/helpers/loading.dart';
import 'package:klicks_app/model/lang.dart';
import 'package:klicks_app/screen/booking_confirm/booking_confirm.dart';
import 'package:klicks_app/screen/edit_profile.dart/edit_profile.dart';
import 'package:klicks_app/screen/forget_password/forget_password.dart';
import 'package:klicks_app/screen/intro/intro.dart';
import 'package:klicks_app/screen/home/navigation_screen.dart';
import 'package:klicks_app/screen/login/login.dart';
import 'package:klicks_app/screen/order_history/order_history.dart';
import 'package:klicks_app/screen/notification/notification.dart';
import 'package:klicks_app/screen/order_status/order_status.dart';
import 'package:klicks_app/screen/profile/profile.dart';
import 'package:klicks_app/screen/profile/translate.dart';
import 'package:klicks_app/screen/signup/signup.dart';
import 'package:klicks_app/screen/splash/splash_screen.dart';
import 'package:klicks_app/translations/codegen_loader.g.dart';
import 'package:klicks_app/values/styles.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await EasyLocalization.ensureInitialized();
  // MessagingManager().configure();
  Stripe.publishableKey =
      'pk_live_51MlTmPAN8zi2vyFsLuiIyZ2kKKBcDLPDU9SgGZau5mYJXSjSLzlEw4LvHRc0ztiT4rSl8nsBnKCU7nTvpuYsMu7u00wg6yt3km';
  Stripe.merchantIdentifier = 'merchant.flutter.stripe';
  Stripe.urlScheme = 'flutterstripe';
  await Stripe.instance.applySettings();
  runApp(EasyLocalization(
      supportedLocales: Language.all,
      path: 'assets/translations',
      useFallbackTranslations: true,
      fallbackLocale: Language.all[0],
      assetLoader: CodegenLoader(),
      child: const MyApp()));
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
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        debugShowCheckedModeBanner: false,
        navigatorKey: navigatorKey,
        builder: EasyLoading.init(),
        theme: Styles.lightTheme,
        title: "Klicks",
        initialRoute: 'splash',
        routes: {
          'splash': (context) => const SplashScreen(),
          'home': (context) => const BottomNavScreen(),
          'booking_confirm': (context) => const BookingConfirm(),
          'order_status': (context) => const OrderStatus(),
          'notification': (context) => const NotificationScreen(),
          'profile': (context) => const ProfileScreeen(),
          'order_histary': (context) => const OrderHistry(),
          'edit_profile': (context) => const EditProfile(),
          'intro': (context) => const IntroScreen(),
          'forgot_screen': (context) => ForgotScreen(),
          'Lang': (context) => TranslateScreen(),
        },
      ),
    );
  }
}
