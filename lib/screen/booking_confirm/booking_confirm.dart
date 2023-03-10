// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:klicks_app/static/button.dart';
import 'package:klicks_app/translations/locale_keys.g.dart';
import 'package:klicks_app/values/colors.dart';
import 'package:easy_localization/easy_localization.dart';

class BookingConfirm extends StatefulWidget {
  const BookingConfirm({super.key});

  @override
  State<BookingConfirm> createState() => _BookingConfirmState();
}

class _BookingConfirmState extends State<BookingConfirm> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainColor,
      body: SafeArea(
        child: Container(
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.only(top: 224),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Image(
                image: AssetImage(
                  'assets/images/Vector.png',
                ),
              ),
              Padding(
                  padding: EdgeInsets.only(
                    top: 21,
                  ),
                  child: Text(
                    LocaleKeys.Booking_Confirmed.tr(),
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.w400,
                        fontFamily: 'Poppins'),
                  )),
              Padding(
                padding: EdgeInsets.only(top: 8),
                child: Text(
                  LocaleKeys.Your_order_has_been_placed_successfully.tr(),
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 13,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'Poppins'),
                ),
              ),
              // Text(
              //   'Order Tracking Id: #2344',
              //   style: TextStyle(
              //       color: Colors.white,
              //       fontSize: 13,
              //       fontWeight: FontWeight.w400,
              //       fontFamily: 'Poppins'),
              // ),
              Padding(
                padding: const EdgeInsets.only(top: 49),
                child: LargeButton(
                  title: LocaleKeys.Got_IT.tr(),
                  screenRatio: 0.75,
                  onPressed: () {
                    Navigator.pushNamed(context, 'home');
                  },
                  color: Colors.white,
                  textcolor: Colors.black,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
