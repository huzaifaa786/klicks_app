// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
      backgroundColor: White,
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset('assets/images/Group 1000005263.svg'),
              Padding(
                  padding: EdgeInsets.only(
                    top: 30,
                  ),
                  child: Text(
                    LocaleKeys.Booking_Confirmed.tr(),
                    style: TextStyle(
                        fontSize: 23,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'Poppins'),
                  )),
              Padding(
                padding: EdgeInsets.only(top: 8),
                child: Text(
                  LocaleKeys.Your_order_has_been_placed_successfully.tr(),
                  style: TextStyle(
                      fontSize: 14,
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
                padding: const EdgeInsets.only(top: 40),
                child: LargeButton(
                  title: 'Back to home',
                  screenRatio: 0.75,
                  onPressed: () {
                    Navigator.pushNamed(context, 'home');
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
