// ignore_for_file: unused_field

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:klicks_app/helpers/loading.dart';
import 'package:klicks_app/screen/login/sigup_otp_screen.dart';
import 'package:klicks_app/static/button.dart';
import 'package:klicks_app/values/colors.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class SignUpOtpScreen extends StatefulWidget {
  const SignUpOtpScreen({super.key, required this.id, required this.phone});
  final String id;
  final String? phone;

  @override
  _SignUpOtpScreenState createState() => _SignUpOtpScreenState();
}

class _SignUpOtpScreenState extends State<SignUpOtpScreen> {
  final TextEditingController _pinController = TextEditingController();
  TextEditingController verificationCode = TextEditingController();

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
            .then((value) {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => SignUpForOtpScreen(phone: number)));
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

  String? number;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      number = widget.phone;
      print(number);
    });
  }

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
                onPressed: () {
                  // compare();
                  verifyPhone();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
