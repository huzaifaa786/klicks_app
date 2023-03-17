import 'package:flutter/material.dart';

class FragmentTwo extends StatefulWidget {
  const FragmentTwo({super.key, required this.controller});
  final PageController controller;
  @override
  State<FragmentTwo> createState() => _FragmentTwoState();
}

class _FragmentTwoState extends State<FragmentTwo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
        padding: EdgeInsets.only(top: 20),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image(
              image: AssetImage(
                'assets/images/i2.png',
              ),
              height: 300,
            ),
            Container(
              padding: EdgeInsets.only(top: 25),
              width: MediaQuery.of(context).size.width * 0.85,
              child: Text(
                'And we offering extra services with best rates.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 12),
              width: MediaQuery.of(context).size.width * 0.85,
              child: Text(
                'Extra services include Oil change, tyre service, engine service and much more.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
              ),
            ),
          ],
        ),
      )),
    );
  }
}
