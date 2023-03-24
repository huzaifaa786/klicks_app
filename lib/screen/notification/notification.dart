// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:klicks_app/api/notification_api.dart';
import 'package:klicks_app/model/notification.dart';
import 'package:klicks_app/static/notification.dart';
import 'package:klicks_app/static/title_topbar.dart';
import 'package:klicks_app/values/colors.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  List<NotificationModal> notification = [];

  getNotification() async {
    var mnotification = await NotificationApi.getnotifications();
    setState(() {
      notification = [];
      notification = mnotification;
    });
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
      body: SafeArea(
          child: Column(
        children: [
          TitleTopbar(
            text: 'Notification',
            ontap: () {
              Navigator.pop(context);
            },
          ),
          Container(
            padding: const EdgeInsets.only(left: 14, right: 14,top: 12),
            height: MediaQuery.of(context).size.height * 0.89,
            child: ListView.builder(
                itemCount: notification.length,
                itemBuilder: (BuildContext context, int index) {
                  return NotificationTile(
                    type: "suv",
                    title: notification[index].title!,
                    // day: notification[index].dateTime.toString(),
                  );
                }),
          ),
        ],
      )),
    );
  }
}
