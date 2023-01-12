import 'package:flutter/material.dart';
import 'package:klicks_app/booking_confirm/booking_confirm.dart';
import 'package:klicks_app/intro/fragments/fragment_1.dart';
import 'package:klicks_app/intro/fragments/fragment_2.dart';
import 'package:klicks_app/intro/fragments/fragment_3.dart';
import 'package:klicks_app/main/main_screen.dart';
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
      initialRoute: 'fragment_3',
      routes: {
        'splash': (context) => const SplashScreen(),
        'home': (context) => const MainScreen(),
        'booking_confirm': (context) => const BookingConfirm(),
         'fragment_1': (context) => const FragmentOne(),
         'fragment_2': (context) => const FragmentTwo(),
         'fragment_3': (context) => const FragmentThree(),
      },
    );
  }
}
