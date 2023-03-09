import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:klicks_app/screen/forget_password/change_password.dart';
import 'package:klicks_app/static/button.dart';
import 'package:klicks_app/values/colors.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen(
      {super.key, required this.otp, required this.emailcontroller});

  final String otp;
  final String emailcontroller;

  @override
  _OtpScreenState createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  final TextEditingController _pinController = TextEditingController();
  int _counter = 30;
  bool _isButtonDisabled = true;

  @override
  void initState() {
    super.initState();
    // startTimer();
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

  compare() async {
    if (_pinController.text != widget.otp) {
      Fluttertoast.showToast(msg: 'Invild Otp.Please enter correct one');
    } else {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) => ChangePasswordScreen(
                    email: widget.emailcontroller,
                  )));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      'assets/images/otp.svg',
                      height: 300,
                      width: 300,
                    ),
                  ],
                ),
              ],
            ),
            Text(
              "Verify OTP",
              textAlign: TextAlign.center,
              maxLines: 2,
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.w600,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Text(
                'Enter the 5 digit code received on your mobile device.',
                textAlign: TextAlign.center,
                maxLines: 2,
                style: TextStyle(
                  fontSize: 23,
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
              length: 5,
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
              onChanged: (String value) {},
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
            Padding(
              padding: const EdgeInsets.only(top: 50, left: 90),
              child: Row(
                children: [
                  Text(
                    'Not Received?',
                     style: TextStyle(fontSize: 18),
                  ),
                  InkWell(
                      child: Text(
                    'Send Again',
                    style: TextStyle(color: Colors.blue, fontSize: 18),
                  ))
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 50.0, bottom: 30),
              child: LargeButton(
                title: "VERIFY",
                onPressed: () {
                  compare();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
