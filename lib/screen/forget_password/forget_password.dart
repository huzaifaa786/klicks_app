import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:klicks_app/api/auth.dart';
import 'package:klicks_app/screen/otp_screen/otp_screen.dart';
import 'package:klicks_app/static/button.dart';
import 'package:klicks_app/static/icon_inputfield.dart';
import 'package:klicks_app/translations/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'dart:ui' as ui;

import 'package:klicks_app/values/colors.dart';

class ForgotScreen extends StatefulWidget {
  const ForgotScreen({super.key});

  @override
  State<ForgotScreen> createState() => _ForgotScreenState();
}

class _ForgotScreenState extends State<ForgotScreen> {
  TextEditingController emailController = TextEditingController();
  // Otp? otp;
  getUser() async {
    if (emailController.text == '') {
      Fluttertoast.showToast(msg: "Input can't be empty.");
    } else {
      var muser = await AuthApi.getuserUsingEmail(emailController.text);
      if (muser != false) {
        // log(company!.name.toString());
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => OtpScreen(
              otp: muser.toString(),
              emailcontroller: emailController.text,
            ),
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: White,
      body: Directionality(
        textDirection: ui.TextDirection.ltr,
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(left: 30, right: 30),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Stack(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image(
                            image: AssetImage(
                              'assets/images/logo1.png',
                            ),
                            height: 220,
                            width: 220,
                          ),
                        ],
                      ),
                    ],
                  ),
                  Text(
                    LocaleKeys.Find_your_account.tr(),
                    textAlign: TextAlign.center,
                    maxLines: 2,
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      LocaleKeys.Enter_email_address_linked_to_your_account.tr(),
                      textAlign: TextAlign.center,
                      maxLines: 2,
                      style: TextStyle(
                        fontSize: 13,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 40.0),
                    child: IconInputField(
                      controller: emailController,
                      imageIcon: 'assets/images/email.svg',
                      hint: LocaleKeys.Email.tr(),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 25.0, bottom: 30),
                    child: LargeButton(
                      title: LocaleKeys.Next.tr(),
                      onPressed: () {
                        getUser();
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
