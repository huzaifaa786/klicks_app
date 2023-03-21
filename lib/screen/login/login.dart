// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:klicks_app/api/auth.dart';
import 'package:klicks_app/screen/home/navigation_screen.dart';
import 'package:klicks_app/static/button.dart';
import 'package:klicks_app/static/icon_inputfield.dart';
import 'package:klicks_app/static/password_inputfield.dart';
import 'package:klicks_app/static/toggle.dart';
import 'package:klicks_app/values/colors.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController verificationCode = TextEditingController();
  bool _obscureText = true;
  String verificationid = "";
  int? resendtoken;
  int? type = 0;
  login() async {
    if (emailController.text == '' || passwordController.text == '') {
      Fluttertoast.showToast(msg: 'Fill out all the Fields. Invalid!');
    } else {
      if (await AuthApi.login(
        emailController,
        passwordController,
      ))
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => BottomNavScreen()));
    }
  }

  Future registerUser() async {
    FirebaseAuth _auth = FirebaseAuth.instance;

    _auth.verifyPhoneNumber(
        phoneNumber:'+923154704013',
        verificationCompleted: (AuthCredential authCredential) {},
        verificationFailed: (FirebaseAuthException authException) {
          print(authException.message);
        },
        codeSent: (String verificationId, int? forceResendingToken) {},
        codeAutoRetrievalTimeout: (String verificationId) {
          verificationId = verificationId;
          print(verificationId);
          print("Timout");
        });
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
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 30, right: 30),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.97,
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
                              "Sign in to continue",
                              style: TextStyle(
                                fontSize: 26,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 20),
                              child: TwoSwitchToggle(
                                onPressed: () {},
                                switchToggle: toggleFun,
                                initialLabelIndex: index,
                                text1: 'Email',
                                text2: 'OTP',
                              ),
                            ),
                            index == 0
                                ? Column(
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(top: 20.0),
                                        child: IconInputField(
                                          controller: emailController,
                                          imageIcon: 'assets/images/email.svg',
                                          hint: 'Email',
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(top: 12.0),
                                        child: InputFieldPassword(
                                          controller: passwordController,
                                          imageIcon: 'assets/images/lock.svg',
                                          hint: 'Password',
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
                                                'Forgot Passowrd?',
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
                                          title: "Sign in",
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
                                            child: Text("OR"),
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
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                right: 20.0),
                                            child: Image(
                                              image: AssetImage(
                                                  'assets/images/facebook.png'),
                                              height: 50,
                                              width: 50,
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                right: 20.0),
                                            child: Image(
                                              image: AssetImage(
                                                  'assets/images/google.png'),
                                              height: 50,
                                              width: 50,
                                            ),
                                          ),
                                          Image(
                                            image: AssetImage(
                                                'assets/images/apple.png'),
                                            height: 50,
                                            width: 50,
                                          )
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
                                              "Enter Phone Number",
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
                                                borderSide:
                                                    BorderSide(color: grey),
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderSide:
                                                    BorderSide(color: grey),
                                              ),
                                            ),
                                            initialCountryCode: 'AE',
                                            onChanged: (phone) {},
                                            keyboardType: TextInputType.phone,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(top: 12),
                                        child: Text(
                                            'By continuing you may an SMS for verification massage and data may apply',
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
                                          title: "Send Otp",
                                          onPressed: () {
                                            registerUser();
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
                        padding: const EdgeInsets.only(bottom: 10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "I dont have an account.",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.pushNamed(context, 'signup');
                              },
                              child: Text(
                                " Sign up",
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
