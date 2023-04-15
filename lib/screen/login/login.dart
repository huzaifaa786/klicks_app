// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, unused_catch_clause, unused_field, unused_element

import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:klicks_app/api/auth.dart';
import 'package:klicks_app/api/otp.dart';
import 'package:klicks_app/helpers/loading.dart';
import 'package:klicks_app/model/mobile_user.dart';
import 'package:klicks_app/screen/checkout/checkout.dart';
import 'package:klicks_app/screen/home/navigation_screen.dart';
import 'package:klicks_app/screen/login/signin_otp.dart';
import 'package:klicks_app/screen/login/signup-otp.dart';
import 'package:klicks_app/screen/main/main_screen.dart';
import 'package:klicks_app/screen/select_car/select_car_obj.dart';
import 'package:klicks_app/screen/signup/signup.dart';
import 'package:klicks_app/static/button.dart';
import 'package:klicks_app/static/icon_inputfield.dart';
import 'package:klicks_app/static/password_inputfield.dart';
import 'package:klicks_app/static/toggle.dart';
import 'package:klicks_app/translations/locale_keys.g.dart';
import 'package:klicks_app/values/colors.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:easy_localization/easy_localization.dart';
import 'dart:ui' as ui;

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key, required this.nextScreen});
  final String? nextScreen;
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController verificationCode = TextEditingController();
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  bool _obscureText = true;
  String verificationid = "";
  int? resendtoken;
  String? complete_phone;
  Map<String, dynamic>? _userData;
  AccessToken? _accessToken;
  bool _checking = true;
  login() async {
    if (emailController.text == '' || passwordController.text == '') {
      Fluttertoast.showToast(msg: 'Fill out all the Fields. Invalid!');
    } else {
      if (await AuthApi.login(
        emailController,
        passwordController,
      )) {
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
    }
  }

  MobUser? user;
  getuser() async {
    var muser = await AuthApi.Mobilelogin(complete_phone);
    if (muser == null) {
      LoadingHelper.dismiss();
      sendTokenforSignUP();
    } else {
      setState(() {
        user = muser;
        LoadingHelper.dismiss();
        // sendToken();
        OtpApi.sendOtp(phoneController.text.toString());
      });
    }
  }

  Future<void> _login() async {
    final LoginResult result = await FacebookAuth.instance
        .login(); // by default we request the email and the public profile

    // loginBehavior is only supported for Android devices, for ios it will be ignored
    // final result = await FacebookAuth.instance.login(
    //   permissions: ['email', 'public_profile', 'user_birthday', 'user_friends', 'user_gender', 'user_link'],
    //   loginBehavior: LoginBehavior
    //       .DIALOG_ONLY, // (only android) show an authentication dialog instead of redirecting to facebook app
    // );

    if (result.status == LoginStatus.success) {
      _accessToken = result.accessToken;
      // _printCredentials();
      // get the user data
      // by default we get the userId, email,name and picture
      final userData = await FacebookAuth.instance.getUserData();
      // final userData = await FacebookAuth.instance.getUserData(fields: "email,birthday,friends,gender,link");
      _userData = userData;
    } else {
      print(result.status);
      print(result.message);
    }

    setState(() {
      _checking = false;
    });
  }

  signInwithGoogle() async {
    try {
      LoadingHelper.show();
      final GoogleSignInAccount? googleSignInAccount =
          await _googleSignIn.signIn();
      var email1 = googleSignInAccount!.email;
      var name = googleSignInAccount.displayName;
      print('email1');
      print(email1);
      LoadingHelper.dismiss();
      if (await AuthApi.googlelogin(email1)) {
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
      } else {
        print(name);
        if (await AuthApi.googleSignup(name, email1, 'google')) {
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
      }
    } on FirebaseAuthException catch (e) {
      Fluttertoast.showToast(msg: 'Google SignIn Failed');
      LoadingHelper.dismiss();
    }
  }

  // void sendToken() async {
  //   LoadingHelper.show();
  //   try {
  //     FirebaseAuth auth = FirebaseAuth.instance;
  //     int? resendtoken;
  //     String verificationid = "";
  //     await auth.verifyPhoneNumber(
  //       timeout: const Duration(minutes: 2),
  //       phoneNumber: complete_phone,
  //       verificationCompleted: (PhoneAuthCredential credential) async {},
  //       verificationFailed: (FirebaseAuthException e) {
  //         LoadingHelper.dismiss();
  //         Fluttertoast.showToast(msg: e.message!);
  //       },
  //       forceResendingToken: resendtoken,
  //       codeSent: (String verificationId, int? resendToken) {
  //         verificationid = verificationId;
  //         resendtoken = resendToken;
  //         LoadingHelper.dismiss();
  //         Fluttertoast.showToast(msg: 'OTP has been successfully send');
  //         if (widget.nextScreen == 'checkout') {
  //           Navigator.push(
  //             context,
  //             MaterialPageRoute(
  //               builder: (context) => SignInOtpScreen(
  //                 id: verificationid,
  //                 user: user,
  //                 nextScreen: 'checkout',
  //               ),
  //             ),
  //           );
  //         } else {
  //           Navigator.push(
  //             context,
  //             MaterialPageRoute(
  //               builder: (context) => SignInOtpScreen(
  //                 id: verificationid,
  //                 user: user,
  //                 nextScreen: "any",
  //               ),
  //             ),
  //           );
  //         }
  //       },
  //       codeAutoRetrievalTimeout: (String verificationId) {
  //         verificationid = verificationId;
  //         // Fluttertoast.showToast(msg: 'TIMEOUT');
  //       },
  //     );
  //   } on FirebaseAuthException catch (e) {
  //     LoadingHelper.dismiss();
  //     Fluttertoast.showToast(msg: e.message!);
  //   }
  // }

  void sendTokenforSignUP() async {
    LoadingHelper.show();
    try {
      FirebaseAuth auth = FirebaseAuth.instance;
      int? resendtoken;
      String verificationid = "";
      await auth.verifyPhoneNumber(
        timeout: const Duration(minutes: 2),
        phoneNumber: complete_phone,
        verificationCompleted: (PhoneAuthCredential credential) async {},
        verificationFailed: (FirebaseAuthException e) {
          LoadingHelper.dismiss();
          Fluttertoast.showToast(msg: e.message!);
        },
        forceResendingToken: resendtoken,
        codeSent: (String verificationId, int? resendToken) {
          verificationid = verificationId;
          resendtoken = resendToken;
          LoadingHelper.dismiss();
          Fluttertoast.showToast(msg: 'OTP has been successfully send');
          if (widget.nextScreen == 'checkout') {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => SignUpOtpScreen(
                  id: verificationid,
                  phone: complete_phone,
                  nextScreen: 'checkout',
                ),
              ),
            );
          } else {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => SignUpOtpScreen(
                  id: verificationid,
                  phone: complete_phone,
                  nextScreen: "any",
                ),
              ),
            );
          }
        },
        codeAutoRetrievalTimeout: (String verificationId) {
          verificationid = verificationId;
          // Fluttertoast.showToast(msg: 'TIMEOUT');
        },
      );
    } on FirebaseAuthException catch (e) {
      LoadingHelper.dismiss();
      Fluttertoast.showToast(msg: e.message!);
    }
  }

  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  int index = 0;
  toggleFun(state) {
    setState(() {
      index = state;
    });
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
            child: Container(
              height: MediaQuery.of(context).size.height * 0.97,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
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
                              // Positioned(
                              //   bottom: 10,
                              //   left: 55,
                              //   child: Text(
                              //     "Sign in to continue",
                              //     style: TextStyle(
                              //       fontSize: 26,
                              //       fontWeight: FontWeight.w600,
                              //     ),
                              //   ),
                              // )
                            ],
                          ),
                          Text(
                            LocaleKeys.Sign_in_to_continue.tr(),
                            style: TextStyle(
                                fontSize: 26,
                                fontWeight: FontWeight.w600,
                                color: Colors.black.withOpacity(0.8)),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 20),
                            child: TwoSwitchToggle(
                              onPressed: () {},
                              switchToggle: toggleFun,
                              initialLabelIndex: index,
                              text1: LocaleKeys.Email.tr(),
                              text2: LocaleKeys.Otp.tr(),
                            ),
                          ),
                          index == 0
                              ? Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(top: 20.0),
                                      child: IconInputField(
                                        controller: emailController,
                                        imageIcon: 'assets/images/email.svg',
                                        hint: LocaleKeys.Email.tr(),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 12.0),
                                      child: InputFieldPassword(
                                        controller: passwordController,
                                        imageIcon: 'assets/images/lock.svg',
                                        hint: LocaleKeys.Password.tr(),
                                        toggle: _toggle,
                                        obscure: _obscureText,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 10.0, bottom: 8),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          InkWell(
                                            onTap: () {
                                              Navigator.pushNamed(
                                                  context, 'forgot_screen');
                                            },
                                            child: Text(
                                              LocaleKeys.Forgot_Password.tr(),
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w500,
                                                  color: Colors.black),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 25.0, bottom: 30),
                                      child: LargeButton(
                                        title: LocaleKeys.Sign_in.tr(),
                                        onPressed: () {
                                          login();
                                        },
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        Expanded(
                                          child: Divider(
                                            color: Colors.black,
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 12.0, right: 12.0),
                                          child: Text(LocaleKeys.Or.tr()),
                                        ),
                                        Expanded(
                                          child: Divider(
                                            color: Colors.black,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        // InkWell(
                                        //   onTap: () {
                                        //     _login();
                                        //   },
                                        //   child: Padding(
                                        //     padding: const EdgeInsets.only(
                                        //         right: 20.0),
                                        //     child: Image(
                                        //       image: AssetImage(
                                        //           'assets/images/facebook.png'),
                                        //       height: 50,
                                        //       width: 50,
                                        //     ),
                                        //   ),
                                        // ),
                                        InkWell(
                                          onTap: () {
                                            signInwithGoogle();
                                          },
                                          child: Image(
                                            image: AssetImage(
                                                'assets/images/google.png'),
                                            height: 50,
                                            width: 50,
                                          ),
                                        ),
                                        // Image(
                                        //   image: AssetImage(
                                        //       'assets/images/apple.png'),
                                        //   height: 50,
                                        //   width: 50,
                                        // )
                                      ],
                                    ),
                                  ],
                                )
                              : Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(top: 20),
                                      child: Row(
                                        children: [
                                          Text(
                                            LocaleKeys.Enter_phone_number.tr(),
                                            style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 14,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 12),
                                      child: Container(
                                        height: 75,
                                        child: IntlPhoneField(
                                          style: TextStyle(fontSize: 14),
                                          controller: phoneController,
                                          decoration: const InputDecoration(
                                            contentPadding:
                                                EdgeInsets.only(bottom: 0.5),
                                            hintStyle: TextStyle(fontSize: 12),
                                            filled: true,
                                            fillColor: White,
                                            border: OutlineInputBorder(
                                              borderSide: BorderSide(),
                                            ),
                                            enabledBorder: OutlineInputBorder(
                                              borderSide:
                                                  BorderSide(color: grey),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderSide:
                                                  BorderSide(color: grey),
                                            ),
                                          ),
                                          initialCountryCode: 'AE',
                                          onChanged: (phone) {
                                            complete_phone =
                                                phone.completeNumber;
                                          },
                                          keyboardType: TextInputType.phone,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 12),
                                      child: Text(
                                          LocaleKeys
                                                  .By_continuing_you_may_an_sms_for_verification_massege_and_data_may_apply
                                              .tr(),
                                          textAlign: TextAlign.justify,
                                          style: TextStyle(
                                            fontSize: 12,
                                            color: Colors.grey,
                                            fontWeight: FontWeight.w500,
                                          )),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 25.0, bottom: 30),
                                      child: LargeButton(
                                        title: LocaleKeys.Send_Otp.tr(),
                                        onPressed: () {
                                          getuser();
                                        },
                                      ),
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                  ],
                                )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10.0, top: 25),
                      child: Directionality(
                        textDirection: context.locale.toString() == 'en'
                            ? ui.TextDirection.ltr
                            : ui.TextDirection.rtl,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              LocaleKeys.I_Dont_have_an_Account.tr(),
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                // if(widget.nextScreen == 'checkout')
                                // Navigator.pushNamed(context, 'signup');
                                if (widget.nextScreen == 'checkout') {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => SignUp(
                                                nextScreen: widget.nextScreen,
                                              )));
                                } else {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => SignUp(
                                                nextScreen: 'any',
                                              )));
                                }
                              },
                              child: Text(
                                LocaleKeys.sign_up.tr(),
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
            ),
          ),
        ),
      ),
    );
  }
}
