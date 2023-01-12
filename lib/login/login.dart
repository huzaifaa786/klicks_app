// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Column(
            children: [
              Stack(
                children: [
                  Image(
                    image: AssetImage(
                      'assets/images/logo1.png',
                    ),
                    height: 350,
                    width: 350,
                  ),
                  Positioned(
                    child: Text("data"),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
