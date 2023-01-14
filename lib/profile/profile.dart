import 'package:flutter/material.dart';
import 'package:klicks_app/static/icon_button.dart';
import 'package:klicks_app/static/title_topbar.dart';
import 'package:klicks_app/values/colors.dart';

class ProfileScreeen extends StatefulWidget {
  const ProfileScreeen({super.key});

  @override
  State<ProfileScreeen> createState() => _ProfileScreeenState();
}

class _ProfileScreeenState extends State<ProfileScreeen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            TitleTopbar(
              text: 'My Profile',
              ontap: () {},
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
              child: Column(
                children: [
                  Container(
                      height: 180,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        color: mainColor,
                      ),
                      child: Padding(
                        padding:
                            const EdgeInsets.only(top: 12, left: 20, right: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Your Balance',
                              style: TextStyle(
                                  fontSize: 22,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w400),
                            ),
                            Row(
                              children: [
                                Text(
                                  'AED',
                                  style: TextStyle(
                                      fontSize: 28,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600),
                                ),
                                Text(
                                  ' 250.00',
                                  style: TextStyle(
                                      fontSize: 30,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600),
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 20),
                              child: IconsButton(
                                title: 'Add Fund',
                                onPressed: () {},
                                iconTrue: false,
                                imgicon:  'assets/images/voilt.svg',
                                screenRatio: 0.3,
                                color: Colors.white,
                                textcolor: Colors.black,
                              ),
                            )
                          ],
                        ),
                      )),
                      
                ],

              ),
            )

          ],
        ),
      ),
    );
  }
}
