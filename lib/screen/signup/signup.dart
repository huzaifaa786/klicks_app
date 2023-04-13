// ignore_for_file: unused_local_variable, unused_catch_clause

import 'dart:convert';
import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:klicks_app/api/auth.dart';
import 'package:klicks_app/helpers/loading.dart';
import 'package:klicks_app/screen/checkout/checkout.dart';
import 'package:klicks_app/screen/home/navigation_screen.dart';
import 'package:klicks_app/screen/login/login.dart';
import 'package:klicks_app/screen/select_car/select_car_obj.dart';
import 'package:klicks_app/static/button.dart';
import 'package:klicks_app/static/checkbox.dart';
import 'package:klicks_app/static/icon_inputfield.dart';
import 'package:klicks_app/static/password_inputfield.dart';
import 'package:klicks_app/translations/locale_keys.g.dart';
import 'package:klicks_app/values/colors.dart';
import 'package:easy_localization/easy_localization.dart';
import 'dart:ui' as ui;

import 'package:shared_preferences/shared_preferences.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key, required this.nextScreen});
  final String? nextScreen;
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
          if (await AuthApi.register(nameController, emailController,
              complete_phone, passwordController, 'email')) {
            if (widget.nextScreen == 'checkout') {
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
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => BottomNavScreen()));
            }
          }
          // Navigator.push(context,
          //     MaterialPageRoute(builder: (context) => CheckOutScreen()));
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
      backgroundColor: White,
      body: Directionality(
        textDirection: ui.TextDirection.ltr,
        child: SafeArea(
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
                    LocaleKeys.Username.tr(),
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
                  ),
                ),
                IconInputField(
                  hint: LocaleKeys.Enter_username.tr(),
                  //  obscure: false,
                  imageIcon: 'assets/images/user.svg',
                  controller: nameController,
                  onChange: onNameChanged,
                ),
                Padding(
                  padding: EdgeInsets.only(top: 12.0, bottom: 6),
                  child: Text(
                    LocaleKeys.phone_number.tr(),
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
                  ),
                ),
                SizedBox(
                  height: 70,
                  child: IntlPhoneField(
                    controller: phoneController,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(bottom: 1),
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
                    LocaleKeys.Email.tr(),
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
                  ),
                ),
                IconInputField(
                  onChange: onEmailChanged,
                  controller: emailController,
                  imageIcon: 'assets/images/email.svg',
                  hint: LocaleKeys.Enter_email.tr(),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 12.0, bottom: 6),
                  child: Text(
                    LocaleKeys.Password.tr(),
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
                  ),
                ),
                InputFieldPassword(
                  controller: passwordController,
                  hint: LocaleKeys.Password.tr(),
                  toggle: _toggle,
                  imageIcon: 'assets/images/lock.svg',
                  obscure: _passwordVisible,
                ),
                Padding(
                  padding: EdgeInsets.only(top: 12.0, bottom: 6),
                  child: Text(
                    LocaleKeys.confirm_password.tr(),
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
                  ),
                ),
                InputFieldPassword(
                  controller: cpasswordController,
                  hint: LocaleKeys.confirm_password.tr(),
                  toggle: _toggle1,
                  imageIcon: 'assets/images/lock.svg',
                  obscure: _cpasswordVisible,
                ),
                MCheckBox(
                    checkbox: checkboxval, onchanged: () => _togglecheckbox()),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0, bottom: 30),
                  child: LargeButton(
                    title: LocaleKeys.sign_up.tr(),
                    onPressed: () {
                      register();
                      // sendToken();
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 10.0),
                  child: Directionality(
                    textDirection: context.locale.toString() == 'en'
                        ? ui.TextDirection.ltr
                        : ui.TextDirection.rtl,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          LocaleKeys.already.tr() + "? ",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.of(context).pushReplacement(
                                new MaterialPageRoute(
                                    builder: (context) =>
                                        new LoginScreen(nextScreen: 'any')));
                          },
                          child: Text(
                            LocaleKeys.Sign_in.tr(),
                            style: TextStyle(
                              color: mainColor,
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        )),
      ),
    );
  }
}
