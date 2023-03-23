import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:klicks_app/api/auth.dart';
import 'package:klicks_app/helpers/loading.dart';
import 'package:klicks_app/screen/home/navigation_screen.dart';
import 'package:klicks_app/screen/otp_screen/otp_screen.dart';
import 'package:klicks_app/static/button.dart';
import 'package:klicks_app/static/checkbox.dart';
import 'package:klicks_app/static/icon_inputfield.dart';
import 'package:klicks_app/static/password_inputfield.dart';
import 'package:klicks_app/values/colors.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController cpasswordController = TextEditingController();

  bool _passwordVisible = true;
  bool _cpasswordVisible = true;
  bool phoneValid = false;
  bool nameValid = false;
  bool emailValid = false;
  String? complete_phone;
  bool checkboxval = false;
  _togglecheckbox() {
    print(checkboxval);
    setState(() {
      checkboxval = !checkboxval;
    });
  }

  void sendToken() async {
    LoadingHelper.show();
    log('log ???????????????????????????????????????? 01');
    // print(phone.text);

    try {
      FirebaseAuth auth = FirebaseAuth.instance;
      int? resendtoken;
      String? last2;
      String verificationid = "";
      await auth.verifyPhoneNumber(
        timeout: const Duration(minutes: 2),
        phoneNumber: complete_phone,
        verificationCompleted: (PhoneAuthCredential credential) async {},
        verificationFailed: (FirebaseAuthException e) {
          LoadingHelper.dismiss();
          log(e.message.toString());
          // Fluttertoast.showToast(msg: e.message.toString());
          // Get.snackbar('Verification failed', e.message!,
          //     snackPosition: SnackPosition.BOTTOM,
          //     backgroundColor: Colors.red,
          //     colorText: primaryTextColor);
        },
        forceResendingToken: resendtoken,
        codeSent: (String verificationId, int? resendToken) {
          last2 = complete_phone!.substring(complete_phone!.length - 2);
          verificationid = verificationId;
          resendtoken = resendToken;
          LoadingHelper.dismiss();
          Fluttertoast.showToast(msg: 'OTP has been successfully send');
          // Get.snackbar('OTP has been successfully send', '',
          //     snackPosition: SnackPosition.BOTTOM,
          //     backgroundColor: Colors.green,
          //     colorText: primaryTextColor);
          //  Navigator.push(
          // context,
          // MaterialPageRoute(
          //   builder: (context) => OtpScreen(
          //     otp: muser.toString(),
          //     emailcontroller: emailController.text,
          //   ),
          // ),
          // );
        },
        codeAutoRetrievalTimeout: (String verificationId) {
          verificationid = verificationId;
          // Get.snackbar('TIMEOUT', '',
          //     snackPosition: SnackPosition.BOTTOM,
          //     backgroundColor: Colors.green,
          //     colorText: primaryTextColor);
        },
      );
    } on FirebaseAuthException catch (e) {
      // Get.snackbar('Verification Failed', e.message!,
      // snackPosition: SnackPosition.BOTTOM,
      // backgroundColor: Colors.red,
      // colorText: primaryTextColor);
    }
  }

  register() async {
    if (checkboxval == true) {
      if (emailValid == false ||
          nameValid == false ||
          nameController.text == '' ||
          phoneController.text == '' ||
          emailController.text == '' ||
          passwordController.text == '' ||
          cpasswordController.text == '') {
        Fluttertoast.showToast(msg: 'Fill out all the Fields. Invalid!');
      } else {
        if (passwordController.text != cpasswordController.text) {
          Fluttertoast.showToast(
              msg: 'Password and Confirm Password field are not same');
        } else {
          if (await AuthApi.register(
            nameController,
            emailController,
            complete_phone,
            passwordController,
          ))
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => BottomNavScreen()));
        }
      }
    } else {
      Fluttertoast.showToast(
          msg: 'Please agree terms and conditions to continue');
    }
  }

  void _toggle() {
    setState(() {
      _passwordVisible = !_passwordVisible;
    });
  }

  void _toggle1() {
    setState(() {
      _cpasswordVisible = !_cpasswordVisible;
    });
  }

  onNameChanged(value) {
    if (value.length > 3) {
      setState(() {
        nameValid = true;
      });
    } else {
      setState(() {
        nameValid = false;
      });
    }
  }

  onEmailChanged(value) {
    if (RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(value)) {
      setState(() {
        emailValid = true;
      });
    } else {
      setState(() {
        emailValid = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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
              Padding(
                padding: EdgeInsets.only(top: 12.0, bottom: 6),
                child: Text(
                  "User Name",
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
                ),
              ),
              IconInputField(
                hint: 'Enter Username',
                //  obscure: false,
                imageIcon: 'assets/images/user.svg',
                controller: nameController,
                onChange: onNameChanged,
              ),
              Padding(
                padding: EdgeInsets.only(top: 12.0, bottom: 6),
                child: Text(
                  "Phone Number",
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
                ),
              ),
              SizedBox(
                height: 70,
                child: IntlPhoneField(
                  controller: phoneController,
                  decoration: const InputDecoration(
                    filled: true,
                    fillColor: White,
                    border: OutlineInputBorder(
                      borderSide: BorderSide(),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: grey),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: grey),
                    ),
                  ),
                  initialCountryCode: 'AE',
                  onChanged: (phone) {
                    complete_phone = phone.completeNumber;
                    log(complete_phone.toString());
                  },
                  keyboardType: TextInputType.phone,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 12.0, bottom: 6),
                child: Text(
                  "Enter Email",
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
                ),
              ),
              IconInputField(
                onChange: onEmailChanged,
                controller: emailController,
                imageIcon: 'assets/images/email.svg',
                hint: 'Email',
              ),
              Padding(
                padding: EdgeInsets.only(top: 12.0, bottom: 6),
                child: Text(
                  "Password",
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
                ),
              ),
              InputFieldPassword(
                controller: passwordController,
                hint: 'Password',
                toggle: _toggle,
                imageIcon: 'assets/images/lock.svg',
                obscure: _passwordVisible,
              ),
              Padding(
                padding: EdgeInsets.only(top: 12.0, bottom: 6),
                child: Text(
                  "Confirm Password",
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
                ),
              ),
              InputFieldPassword(
                controller: cpasswordController,
                hint: 'Confirm Password',
                toggle: _toggle1,
                imageIcon: 'assets/images/lock.svg',
                obscure: _cpasswordVisible,
              ),
              MCheckBox(
                  checkbox: checkboxval, onchanged: () => _togglecheckbox()),
              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 30),
                child: LargeButton(
                  title: "Sign up",
                  onPressed: () {
                    register();
                    // sendToken();
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "I already have an account.",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, 'login');
                      },
                      child: Text(
                        " Sign in",
                        style: TextStyle(
                          color: mainColor,
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      )),
    );
  }
}
