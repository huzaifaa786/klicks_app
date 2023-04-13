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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image(
              image: AssetImage(
                'assets/images/ii1.jpg',
              ),
              height: 300,
            ),
            Container(
              padding: EdgeInsets.only(top: 25),
              width: MediaQuery.of(context).size.width * 0.85,
              child: Text(
                'Wash your Car from our professional trained workers.',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'OpenSans'),
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 12),
              width: MediaQuery.of(context).size.width * 0.85,
              child: Text(
                'All you have to do is fill up the required information , and a car wash professional will be available instantly to wash your car while you are enjoying your coffee',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    fontFamily: 'OpenSans'),
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 12),
              width: MediaQuery.of(context).size.width * 0.85,
              child: Text(
                'كل ما عليك فعله هو تعبئة البيانات المطلوبة و بعدها سوف يأتي محترف غسيل السيارات مباشرةً لغسيل سيارتك في الوقت الذي تستمتع به في شراب قهوتك',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    fontFamily: 'OpenSans'),
              ),
            ),
          ],
        ),
      )),
    );
  }
}
