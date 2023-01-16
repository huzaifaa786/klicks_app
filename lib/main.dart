import 'package:flutter/material.dart';
import 'package:klicks_app/screen/booking_confirm/booking_confirm.dart';
import 'package:klicks_app/screen/checkout/checkout.dart';
import 'package:klicks_app/screen/main/intro/fragments/fragment_1.dart';
import 'package:klicks_app/screen/main/intro/fragments/fragment_2.dart';
import 'package:klicks_app/screen/main/intro/fragments/fragment_3.dart';
import 'package:klicks_app/screen/main/login/login.dart';
import 'package:klicks_app/screen/main/main_screen.dart';
import 'package:klicks_app/screen/order_history/order_histary.dart';
import 'package:klicks_app/screen/select_car/select_car.dart';
import 'package:klicks_app/screen/notification/notification.dart';
import 'package:klicks_app/screen/order%20status/order_status.dart';
import 'package:klicks_app/screen/profile/profile.dart';
import 'package:klicks_app/screen/splash/splash_screen.dart';
import 'package:klicks_app/screen/top_up/top_up.dart';
import 'package:klicks_app/values/styles.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: Styles.lightTheme,
      title: "Klicks",
      initialRoute: 'checkOut',
      routes: {
        'splash': (context) => const SplashScreen(),
        'login': (context) => const LoginScreen(),
        'home': (context) => const MainScreen(),
        'booking_confirm': (context) => const BookingConfirm(),
        'fragment_1': (context) => const FragmentOne(),
        'fragment_2': (context) => const FragmentTwo(),
        'fragment_3': (context) => const FragmentThree(),
        'select_car': (context) => const CarSelect(),
        'order_status': (context) => const OrderStatus(),
        'notification': (context) => const NotificationScreen(),
        'profile': (context) => const ProfileScreeen(),
        'checkOut': (context) => const CheckOutScreen(),
        'order_histary': (context) => const OrderHistry(),
        'top_up': (context) => const TopUp(),
      },
    );
  }
}
