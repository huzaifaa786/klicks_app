// ignore_for_file: unused_local_variable, unused_catch_clause

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:klicks_app/api/auth.dart';
import 'package:klicks_app/screen/home/navigation_screen.dart';
import 'package:klicks_app/static/button.dart';
import 'package:klicks_app/static/checkbox.dart';
import 'package:klicks_app/static/icon_inputfield.dart';
import 'package:klicks_app/static/password_inputfield.dart';

class SignUpForOtpScreen extends StatefulWidget {
  const SignUpForOtpScreen({super.key, this.phone});
  final String? phone;
  @override
  State<SignUpForOtpScreen> createState() => _SignUpForOtpScreenState();
}

class _SignUpForOtpScreenState extends State<SignUpForOtpScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController cpasswordController = TextEditingController();

  bool _passwordVisible = true;
  bool _cpasswordVisible = true;
  bool nameValid = false;
  bool emailValid = false;
  bool checkboxval = false;
  _togglecheckbox() {
    print(checkboxval);
    setState(() {
      checkboxval = !checkboxval;
    });
  }

  register() async {
    if (checkboxval == true) {
      if (emailValid == false ||
          nameValid == false ||
          nameController.text == '' ||
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
              widget.phone!, passwordController, 'otp'))
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
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      print(widget.phone);
    });
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
                  title: "Proceed",
                  onPressed: () {
                    register();
                  },
                ),
              ),
            ],
          ),
        ),
      )),
    );
  }
}
