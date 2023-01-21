import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
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
  bool _obscureText = true;
  bool show = false;

  void _toggle() {
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
              ),
              Padding(
                padding: EdgeInsets.only(top: 12.0, bottom: 6),
                child: Text(
                  "Phone Number",
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
                ),
              ),
              IntlPhoneField(
                        decoration: const InputDecoration(
                          filled: true,
                          fillColor: fieldColor,
                          border: InputBorder.none,
                        ),
                        initialCountryCode: 'AE',
                        onChanged: (phone) {
                        },
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
                hint: 'Password',
                toggle: _toggle,
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
                hint: 'Confirm Password',
                toggle: _toggle,
                obscure: _obscureText,
              ),
               Padding(
                      padding: const EdgeInsets.only(top: 25.0, bottom: 30),
                      child: LargeButton(
                        title: "Sign up",
                        onPressed: () {
                         
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
