import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:klicks_app/api/auth.dart';
import 'package:klicks_app/screen/login/login.dart';
import 'package:klicks_app/static/button.dart';
import 'package:klicks_app/static/password_inputfield.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({super.key, required this.email});

  final String email;

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  TextEditingController passwordController = TextEditingController();
  bool _obscureText = true;

  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  ResetPassword() async {
    if (passwordController.text == '') {
      Fluttertoast.showToast(msg: "Field can't. Invalid!");
    } else {
      await AuthApi.forget(widget.email, passwordController.text);
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => LoginScreen(nextScreen: 'any',)),
          (route) => false);
      Fluttertoast.showToast(msg: 'update successfully');
      passwordController.text = '';
    }
  }

  @override
  void initState() {
    super.initState();
    // log(widget.emailcontroller);
    // log(widget.api_token);
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
                  "Reset Password Of Your Account",
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                // Padding(
                //   padding: const EdgeInsets.all(8.0),
                //   child: Text(
                //     "Enter email address linked to your account.",
                //     textAlign: TextAlign.center,
                //     maxLines: 2,
                //     style: TextStyle(
                //       fontSize: 13,
                //     ),
                //   ),
                // ),
                Padding(
                  padding: const EdgeInsets.only(top: 40.0),
                  child: InputFieldPassword(
                    controller: passwordController,
                    imageIcon: 'assets/images/lock.svg',
                    hint: 'Password',
                    toggle: _toggle,
                    obscure: _obscureText,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 25.0, bottom: 30),
                  child: LargeButton(
                    title: "Change Password",
                    onPressed: () {
                      ResetPassword();
                    },
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
