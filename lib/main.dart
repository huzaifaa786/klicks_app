import 'package:flutter/material.dart';
import 'package:klicks_app/booking_confirm/booking_confirm.dart';
import 'package:klicks_app/checkout/checkout.dart';
import 'package:klicks_app/intro/fragments/fragment_1.dart';
import 'package:klicks_app/intro/fragments/fragment_2.dart';
import 'package:klicks_app/intro/fragments/fragment_3.dart';
import 'package:klicks_app/login/login.dart';
import 'package:klicks_app/main/main_screen.dart';
import 'package:klicks_app/select_car/select_car.dart';
import 'package:klicks_app/notification/notification.dart';
import 'package:klicks_app/order%20status/order_status.dart';
import 'package:klicks_app/profile/profile.dart';
import 'package:klicks_app/splash/splash_screen.dart';
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
      },
    );
  }
}
