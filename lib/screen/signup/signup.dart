import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:klicks_app/api/auth.dart';
import 'package:klicks_app/helpers/shared_pref.dart';
import 'package:klicks_app/screen/home/navigation_screen.dart';
import 'package:klicks_app/static/button.dart';
import 'package:klicks_app/static/icon_inputfield.dart';
import 'package:klicks_app/static/inputfield.dart';
import 'package:klicks_app/static/pass_inputfield_two.dart';
import 'package:intl/intl.dart';
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

  register() async {
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
          phoneController,
          passwordController,
        ))
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => BottomNavScreen()));
      }
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

  gotoBack() {
    Navigator.pop(context);
  }

  bool _obscureText = true;
  bool show = false;

  void _toggle2() {
    setState(() {
      _obscureText = !_obscureText;
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
              InputField(
                hint: 'Enter Username',
                //  obscure: false,
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
              IntlPhoneField(
                controller: phoneController,
                decoration: const InputDecoration(
                  filled: true,
                  fillColor: fieldColor,
                  border: InputBorder.none,
                ),
                initialCountryCode: 'AE',
                onChanged: (phone) {},
                keyboardType: TextInputType.phone,
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
              InputFieldPasswordTwo(
                controller: passwordController,
                hint: 'Password',
                toggle: _toggle2,
                obscure: _obscureText,
              ),
              Padding(
                padding: EdgeInsets.only(top: 12.0, bottom: 6),
                child: Text(
                  "Confirm Password",
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
                ),
              ),
              InputFieldPasswordTwo(
                controller: cpasswordController,
                hint: 'Confirm Password',
                toggle: _toggle2,
                obscure: _obscureText,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 25.0, bottom: 30),
                child: LargeButton(
                  title: "Sign up",
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
