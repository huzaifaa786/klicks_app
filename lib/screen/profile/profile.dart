import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:klicks_app/api/auth.dart';
import 'package:klicks_app/model/lang.dart';
import 'package:klicks_app/screen/home/navigation_screen.dart';
import 'package:klicks_app/static/icon_button.dart';
import 'package:klicks_app/static/logoutTile.dart';
import 'package:klicks_app/static/profile.tile.dart';
import 'package:klicks_app/static/title_topbar.dart';
import 'package:klicks_app/translations/locale_keys.g.dart';
import 'package:klicks_app/values/colors.dart';
import 'package:easy_localization/easy_localization.dart';

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
              text: LocaleKeys.My_Profile.tr(),
              ontap: () {
                Navigator.popAndPushNamed(context, 'home');
              },
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
                            Container(
                              height: 60,
                              padding: const EdgeInsets.only(top: 10),
                              child: IconsButton(
                                title: 'Add Fund',
                                onPressed: () {
                                  Navigator.pushNamed(context, 'top_up');
                                },
                                iconTrue: false,
                                imgicon: 'assets/images/voilt.svg',
                                screenRatio: 0.32,
                                color: Colors.white,
                                textcolor: Colors.black,
                              ),
                            )
                          ],
                        ),
                      )),
                  Padding(
                    padding: const EdgeInsets.only(top: 30),
                    child: ProfileTile(
                      image: 'assets/images/profile.svg',
                      text: 'Edit Profile',
                      ontap: () {
                        Navigator.pushNamed(context, 'edit_profile');
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: ProfileTile(
                      image: 'assets/images/language.svg',
                      text: 'Language',
                      ontap: () {},
                    ),
                  ),
                  // Padding(
                  //   padding: const EdgeInsets.only(top: 10),
                  //   child: ProfileTile(
                  //     image: 'assets/images/setting.svg',
                  //     text: 'Settings',
                  //     ontap: () {},
                  //   ),
                  // ),
                  Padding(
                    padding: const EdgeInsets.only(top: 14),
                    child: LogOutTile(
                        image: 'assets/images/logout.svg',
                        text: 'Log out',
                        ontap: () {
                          AuthApi.logout();
                          Navigator.pushNamedAndRemoveUntil(
                              context, 'login', (route) => false);
                          Fluttertoast.showToast(msg: "Logout successful");
                        }),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
