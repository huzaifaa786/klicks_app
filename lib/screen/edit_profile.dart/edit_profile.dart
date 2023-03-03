// ignore_for_file: prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:klicks_app/api/auth.dart';
import 'package:klicks_app/model/User.dart';
import 'package:klicks_app/static/button.dart';
import 'package:klicks_app/static/icon_button.dart';
import 'package:klicks_app/static/inputfield.dart';
import 'package:klicks_app/static/pass_inputfield_two.dart';
import 'package:klicks_app/static/title_topbar.dart';
import 'package:klicks_app/values/colors.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  bool _obscureText = true;
  bool show = false;

  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  User? user;
  getuser() async {
    var muser = await AuthApi.getuser();
    setState(() {
      user = muser;
      nameController.text = user!.name!;
      phoneController.text = user!.phone!;
    });
  }

  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      getuser();
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
              ontap: () {
                Navigator.pop(context);
              },
              text: 'Edit Profile',
            ),
            Flexible(
              child: Container(
                height: MediaQuery.of(context).size.height * 0.89,
                padding: const EdgeInsets.only(left: 20, right: 20, top: 30),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: 12.0, bottom: 6),
                          child: Text(
                            "Username",
                            style: TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 16),
                          ),
                        ),
                        InputField(
                          readOnly: true,
                          hint: 'Enter Username',
                          controller: nameController,
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 12.0, bottom: 6),
                          child: Text(
                            "Phone Number",
                            style: TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 16),
                          ),
                        ),
                        InputField(
                          readOnly: true,
                          hint: 'Enter phone number',
                          controller: phoneController,
                          type: TextInputType.number,
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 12.0, bottom: 6),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Password",
                                style: TextStyle(
                                    fontWeight: FontWeight.w500, fontSize: 16),
                              ),
                              InkWell(
                                onTap: () {
                                  ChangePassword(context, user!.email);
                                },
                                child: Text(
                                  "Chnage Password",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16,
                                      color: mainColor),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    //   show == false
                    //       ? Padding(
                    //           padding: const EdgeInsets.only(bottom: 12),
                    //           child: LargeButton(
                    //               title: "Update Profile",
                    //               onPressed: () {
                    //                 setState(() {
                    //                   show = !show;
                    //                 });
                    //               }),
                    //         )
                    //       : Padding(
                    //           padding: const EdgeInsets.only(bottom: 12),
                    //           child: IconsButton(
                    //             title: 'Changes saved successfully!',
                    //             color: Colors.green,
                    //             rounded: true,
                    //             onPressed: () {
                    //               setState(() {
                    //                 show = !show;
                    //               });
                    //             },
                    //           ),
                    //         )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  ChangePassword(context, email) {
    TextEditingController currentPassword = TextEditingController();
    TextEditingController newPassword = TextEditingController();
    TextEditingController confirmNewPassword = TextEditingController();

    change() async {
      if (currentPassword.text == '' ||
          newPassword.text == '' ||
          confirmNewPassword.text == '') {
        Fluttertoast.showToast(msg: 'Fill out all the Fields. Invalid!');
      } else {
        if (newPassword.text != confirmNewPassword.text) {
          Fluttertoast.showToast(msg: 'New and Confirm password must be same');
        } else {
          await AuthApi.changeposward(
            email.toString(),
            currentPassword,
            newPassword,
          );
          Navigator.pop(context);
          currentPassword.text = '';
          newPassword.text = '';
          confirmNewPassword.text = '';
        }
      }
    }

    Alert(
        context: context,
        title: "Change Password",
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 6),
            Text(
              "Current Password",
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
            ),
            SizedBox(height: 4),
            InputField(
              hint: 'Enter current password',
              obscure: true,
              controller: currentPassword,
            ),
            SizedBox(height: 6),
            Text(
              "New Password",
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
            ),
            SizedBox(height: 4),
            InputField(
              hint: 'Enter new password',
              obscure: true,
              controller: newPassword,
            ),
            SizedBox(height: 6),
            Text(
              "Confirm New Password",
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
            ),
            SizedBox(height: 4),
            InputField(
              hint: 'Enter confirm new password',
              obscure: true,
              controller: confirmNewPassword,
            ),
          ],
        ),
        buttons: [
          DialogButton(
            color: mainColor,
            onPressed: () async {
              await change();
            },
            child: Text(
              "Change Password",
              style: TextStyle(color: Colors.white, fontSize: 14),
            ),
          )
        ]).show();
  }
}
