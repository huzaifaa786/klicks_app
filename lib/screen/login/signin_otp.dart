// ignore_for_file: unused_field

import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:klicks_app/helpers/loading.dart';
import 'package:klicks_app/helpers/shared_pref.dart';
import 'package:klicks_app/model/mobile_user.dart';
import 'package:klicks_app/screen/checkout/checkout.dart';
import 'package:klicks_app/screen/home/navigation_screen.dart';
import 'package:klicks_app/screen/select_car/select_car_obj.dart';
import 'package:klicks_app/static/button.dart';
import 'package:klicks_app/translations/locale_keys.g.dart';
import 'package:klicks_app/values/colors.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:ui' as ui;
import 'package:easy_localization/easy_localization.dart';

class SignInOtpScreen extends StatefulWidget {
  const SignInOtpScreen(
      {super.key, required this.id, this.user, required this.nextScreen});
  final String id;
  final MobUser? user;
  final String? nextScreen;

  @override
  _SignInOtpScreenState createState() => _SignInOtpScreenState();
}

class _SignInOtpScreenState extends State<SignInOtpScreen> {
  final TextEditingController _pinController = TextEditingController();
  TextEditingController verificationCode = TextEditingController();
  int _counter = 30;
  bool _isButtonDisabled = true;

  @override
  void initState() {
    super.initState();
    // startTimer();
    print(widget.user!.apiToken.toString());
    print(widget.user!.apiToken.toString());
  }

  // void startTimer() {
  //   print(widget.otp.toString());
  //   print('fddfgdfgf');
  //   Timer.periodic(Duration(seconds: 1), (timer) {
  //     if (_counter > 0) {
  //       setState(() {
  //         _counter--;
  //       });
  //     } else {
  //       setState(() {
  //         _isButtonDisabled = false;
  //       });
  //       timer.cancel();
  //     }
  //   });
  // }

  // compare() async {
  //   if (_pinController.text != widget.otp) {
  //     Fluttertoast.showToast(msg: 'Invild Otp.Please enter correct one');
  //   } else {
  //     Navigator.pushReplacement(
  //         context,
  //         MaterialPageRoute(
  //             builder: (context) => ChangePasswordScreen(
  //                   email: widget.emailcontroller,
  //                 )));
  //   }
  // }

  FirebaseAuth auth = FirebaseAuth.instance;
  String? otp;

  void verifyPhone() async {
    try {
      if (otp!.length == 6) {
        LoadingHelper.show();
        await auth
            .signInWithCredential(PhoneAuthProvider.credential(
          verificationId: widget.id,
          smsCode: otp!,
        ))
            .then((value) async {
          if (widget.nextScreen == 'checkout') {
            print(widget.user!.apiToken.toString());
            SharedPreferencesHelper.setString(
                'api_token', widget.user!.apiToken.toString());
            SharedPreferencesHelper.setString(
                'user_id', widget.user!.id.toString());
            final prefs = await SharedPreferences.getInstance();
            var mdata = prefs.getString('data');
            var jsonstring = jsonDecode(mdata!);
            print(jsonstring);
            SelectedCarInfo carinfo = SelectedCarInfo.fromJson(jsonstring);
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => CheckOutScreen(
                          data: carinfo,
                        )));
          } else {
            print(widget.user!.apiToken.toString());
            SharedPreferencesHelper.setString(
                'api_token', widget.user!.apiToken.toString());
            SharedPreferencesHelper.setString(
                'user_id', widget.user!.id.toString());
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => BottomNavScreen()));
          }

          // Navigator.push(context,
          //     MaterialPageRoute(builder: (context) => BottomNavScreen()));
          LoadingHelper.dismiss();
        });
      } else {
        Fluttertoast.showToast(msg: 'Plese Enter Complete Code');
      }
    } on FirebaseAuthException catch (e) {
      LoadingHelper.dismiss();
      Fluttertoast.showToast(msg: e.message!);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Directionality(
        textDirection: ui.TextDirection.ltr,
        child: Container(
          padding: EdgeInsets.all(25.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Stack(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FittedBox(
                        fit: BoxFit.scaleDown,
                        child: SvgPicture.asset(
                          'assets/images/otp.svg',
                          height: 200,
                          width: 200,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Text(
                  LocaleKeys.verify_otp.tr(),
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Text(
                  LocaleKeys
                          .Enter_the_6_Digit_code_receive_on_your_mobile_device
                      .tr(),
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  style: TextStyle(
                    fontSize: 17,
                    color: Colors.grey,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              SizedBox(height: 20),
              PinCodeTextField(
                appContext: context,
                pastedTextStyle: TextStyle(
                  color: Colors.green.shade600,
                  fontWeight: FontWeight.bold,
                ),
                length: 6,
                blinkWhenObscuring: true,
                animationType: AnimationType.fade,
                pinTheme: PinTheme(
                    shape: PinCodeFieldShape.box,
                    borderWidth: 2,
                    borderRadius: BorderRadius.circular(10),
                    fieldHeight: 60,
                    fieldWidth: 50,
                    activeFillColor: Colors.white,
                    selectedColor: mainColor,
                    selectedFillColor: Colors.white,
                    inactiveFillColor: Colors.white.withOpacity(0.5),
                    inactiveColor: mainColor.withOpacity(0.1),
                    activeColor: mainColor.withOpacity(0.2)),
                cursorColor: Colors.black,
                animationDuration: const Duration(milliseconds: 300),
                enableActiveFill: true,
                enablePinAutofill: true,
                controller: _pinController,
                keyboardType: TextInputType.number,
                autovalidateMode: AutovalidateMode.disabled,
                onChanged: (String value) {
                  otp = value;
                },
              ),
              // SizedBox(height: 20),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.end,
              //   children: [
              //     _isButtonDisabled
              //         ? Row(
              //             children: [
              //               Text(
              //                 'Send OTP in ',
              //                 style: TextStyle(color: mainColor),
              //               ),
              //               Text(
              //                 ' $_counter ',
              //               ),
              //               Text(
              //                 'seconds',
              //                 style: TextStyle(color: mainColor),
              //               ),
              //             ],
              //           )
              //         : InkWell(
              //             onTap: (() {}),
              //             child: Text(
              //               'Resend OTP',
              //               style: TextStyle(color: Colors.blue, fontSize: 16),
              //             ),
              //           ),
              //   ],
              // ),
              // Padding(
              //   padding: const EdgeInsets.only(top: 40),
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.center,
              //     children: [
              //       Text(
              //         'Not Received?',
              //         style: TextStyle(fontSize: 16),
              //       ),
              //       SizedBox(width: 4),
              //       InkWell(
              //           child: Text(
              //         'Send Again',
              //         style: TextStyle(color: Colors.blue, fontSize: 16),
              //       ))
              //     ],
              //   ),
              // ),
              Padding(
                padding: const EdgeInsets.only(top: 40.0, bottom: 30),
                child: LargeButton(
                  title: LocaleKeys.Verify.tr(),
                  onPressed: () {
                    // compare();
                    verifyPhone();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
