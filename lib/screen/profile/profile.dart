import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:klicks_app/api/auth.dart';
import 'package:klicks_app/api/strip.dart';
import 'package:klicks_app/model/Account.dart';
import 'package:klicks_app/screen/home/navigation_screen.dart';
import 'package:klicks_app/screen/login/login.dart';
import 'package:klicks_app/screen/main/main_screen.dart';
import 'package:klicks_app/screen/top_up/top_up.dart';
import 'package:klicks_app/static/button.dart';
import 'package:klicks_app/static/icon_button.dart';
import 'package:klicks_app/static/logoutTile.dart';
import 'package:klicks_app/static/profile.tile.dart';
import 'package:klicks_app/static/title_topbar.dart';
import 'package:klicks_app/translations/locale_keys.g.dart';
import 'package:klicks_app/values/colors.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileScreeen extends StatefulWidget {
  const ProfileScreeen({super.key});

  @override
  State<ProfileScreeen> createState() => _ProfileScreeenState();
}

class _ProfileScreeenState extends State<ProfileScreeen> {
  Account? account;
  String? authCheck;
  bool search = false;
  getbalance() async {
    final prefs = await SharedPreferences.getInstance();
    authCheck = prefs.getString('api_token');
    if (authCheck != null) {
      var mbalance = await StripeApi.balance();
      setState(() {
        account = mbalance;
        search = true;
      });
    } else {
      setState(() {
        search = true;
      });
    }
  }

  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      getbalance();
    });
    super.initState();
  }

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
            search != false
                ? authCheck != null
                    ? Padding(
                        padding:
                            const EdgeInsets.only(top: 20, left: 20, right: 20),
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
                                  padding: const EdgeInsets.only(
                                      left: 20, right: 10),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            LocaleKeys.Your_Balance.tr(),
                                            style: TextStyle(
                                                fontSize: 22,
                                                color: Colors.white,
                                                fontWeight: FontWeight.w400),
                                          ),
                                          Row(
                                            children: [
                                              Text(
                                                'AED ',
                                                style: TextStyle(
                                                    fontSize: 28,
                                                    color: Colors.white,
                                                    fontWeight:
                                                        FontWeight.w600),
                                              ),
                                              Text(
                                                account == null
                                                    ? "0"
                                                    : account!.balance
                                                        .toString(),
                                                style: TextStyle(
                                                    fontSize: 30,
                                                    color: Colors.white,
                                                    fontWeight:
                                                        FontWeight.w600),
                                              ),
                                            ],
                                          ),
                                          Container(
                                            height: 60,
                                            padding:
                                                const EdgeInsets.only(top: 10),
                                            child: IconsButton(
                                              title: LocaleKeys.Add_fund.tr(),
                                              onPressed: () {
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            TopUp()));
                                              },
                                              iconTrue: false,
                                              rounded: true,
                                              imgicon:
                                                  'assets/images/voilt.svg',
                                              screenRatio: 0.32,
                                              color: Colors.white,
                                              textcolor: Colors.black,
                                            ),
                                          )
                                        ],
                                      ),
                                      Image(
                                          image: AssetImage(
                                              'assets/images/wallet1.png'))
                                    ],
                                  ),
                                )),
                            Padding(
                              padding: const EdgeInsets.only(top: 30),
                              child: ProfileTile(
                                image: 'assets/images/profile.svg',
                                text: LocaleKeys.Edit_Profile.tr(),
                                ontap: () {
                                  Navigator.pushNamed(context, 'edit_profile');
                                },
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 10),
                              child: ProfileTile(
                                image: 'assets/images/language.svg',
                                text: LocaleKeys.Language.tr(),
                                ontap: () {
                                  Navigator.pushNamed(context, 'Lang');
                                },
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
                                  text: LocaleKeys.Log_out.tr(),
                                  ontap: () {
                                    AuthApi.logout();
                                    Navigator.of(context).pushAndRemoveUntil(
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                BottomNavScreen()),
                                        (Route<dynamic> route) => false);
                                    Fluttertoast.showToast(
                                        msg: "Logout successful");
                                  }),
                            )
                          ],
                        ),
                      )
                    : Container(
                        padding:
                            const EdgeInsets.only(left: 14, right: 14, top: 12),
                        height: MediaQuery.of(context).size.height * 0.8,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width * 0.76,
                              padding: const EdgeInsets.only(bottom: 12),
                              child: Text(
                                LocaleKeys.to_see_profile.tr(),
                                textAlign: TextAlign.center,
                                maxLines: 2,
                              ),
                            ),
                            LargeButton(
                                screenRatio: 0.8,
                                title: LocaleKeys.Sign_in.tr(),
                                onPressed: () {
                                  Navigator.of(context)
                                      .push(new MaterialPageRoute(
                                          builder: (context) => new LoginScreen(
                                                nextScreen: 'any',
                                              )));
                                })
                          ],
                        ))
                : Container(),
          ],
        ),
      ),
    );
  }
}
