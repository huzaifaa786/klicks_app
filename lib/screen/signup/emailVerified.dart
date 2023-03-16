import 'package:flutter/material.dart';
import 'package:klicks_app/static/button.dart';
import 'package:klicks_app/values/colors.dart';

class VerifedScreen extends StatefulWidget {
  const VerifedScreen({super.key});

  @override
  _VerifedScreenState createState() => _VerifedScreenState();
}

class _VerifedScreenState extends State<VerifedScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: White,
      body: Container(
        padding: EdgeInsets.all(25.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 90,
              width: 90,
              decoration: BoxDecoration(
                border: Border.all(color: mainColor),
                borderRadius: BorderRadius.all(Radius.circular(45)),
                color: mainColor,
              ),
              child: Icon(Icons.check, size: 45, color: White),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: Text(
                "Good News! ",
                textAlign: TextAlign.center,
                maxLines: 2,
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.6,
              padding: const EdgeInsets.only(top: 20),
              child: Text(
                'You email has been verified Thank you.',
                textAlign: TextAlign.center,
                maxLines: 2,
                style: TextStyle(
                  fontSize: 17,
                  color: Colors.grey,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 40.0, bottom: 30),
              child: LargeButton(
                title: "Get Started",
                onPressed: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
