// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:klicks_app/api/notification_api.dart';
import 'package:klicks_app/helpers/shared_pref.dart';
import 'package:klicks_app/model/notification.dart';
import 'package:klicks_app/screen/login/login.dart';
import 'package:klicks_app/screen/notification/notification%20detail.dart';
import 'package:klicks_app/static/button.dart';
import 'package:klicks_app/static/notification.dart';
import 'package:klicks_app/static/title_topbar.dart';
import 'package:klicks_app/translations/locale_keys.g.dart';
import 'package:klicks_app/values/colors.dart';
import 'dart:ui' as ui;
import 'package:easy_localization/easy_localization.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  List<NotificationModal> notification = [];
  String? authCheck;
  bool search = false;
  getNotification() async {
    final prefs = await SharedPreferences.getInstance();
    authCheck = prefs.getString('api_token');
    if (authCheck != null) {
      var mnotification = await NotificationApi.getnotifications();
      setState(() {
        notification = [];
        notification = mnotification;
        search = true;
      });
    } else {
      setState(() {
        search = true;
      });
    }
  }

  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      getNotification();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: White,
      body: Directionality(
        textDirection: ui.TextDirection.ltr,
        child: SafeArea(
            child: Column(
          children: [
            TitleTopbar(
              text: LocaleKeys.Notification.tr(),
              ontap: () {
                Navigator.pop(context);
              },
            ),
            search != false
                ? authCheck != null
                    ? Container(
                        padding:
                            const EdgeInsets.only(left: 14, right: 14, top: 12),
                        height: MediaQuery.of(context).size.height * 0.89,
                        child: ListView.builder(
                            itemCount: notification.length,
                            itemBuilder: (BuildContext context, int index) {
                              return NotificationTile(
                                type: notification[index].cartype,
                                title: notification[index].title! ==
                                        'New order placed'
                                    ? LocaleKeys.New_Order_Placed.tr()
                                    : notification[index].title! ==
                                            'Your order has been accepted'
                                        ? LocaleKeys.Order_has_accepted.tr()
                                        : notification[index].title! ==
                                                'Your order has been rejected and order amount was refunded'
                                            ? LocaleKeys.Order_has_rejected.tr()
                                            : LocaleKeys.Order_has_completed
                                                .tr(),
                                ontap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              NotificationDetail(
                                                  order: notification[index])));
                                },
                              );
                            }),
                      )
                    : Container(
                        padding:
                            const EdgeInsets.only(left: 14, right: 14, top: 12),
                        height: MediaQuery.of(context).size.height * 0.89,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width * 0.76,
                              padding: const EdgeInsets.only(bottom: 12),
                              child: Text(
                                LocaleKeys.to_see_Noti.tr(),
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
        )),
      ),
    );
  }
}
