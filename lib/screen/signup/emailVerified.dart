import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:klicks_app/screen/forget_password/change_password.dart';
import 'package:klicks_app/static/button.dart';
import 'package:klicks_app/values/colors.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class VerifyScreen extends StatefulWidget {
  const VerifyScreen(
      {super.key, required this.otp, required this.emailcontroller});

  final String otp;
  final String emailcontroller;

  @override
  _VerifyScreenState createState() => _VerifyScreenState();
}

class _VerifyScreenState extends State<VerifyScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
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
                "Verify OTP",
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
                'Enter the 6 digit code received on your mobile device.',
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
            Padding(
              padding: const EdgeInsets.only(top: 40),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Not Received?',
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(width: 4),
                  InkWell(
                      child: Text(
                    'Send Again',
                    style: TextStyle(color: Colors.blue, fontSize: 16),
                  ))
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 40.0, bottom: 30),
              child: LargeButton(
                title: "VERIFY",
                onPressed: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
