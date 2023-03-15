// ignore_for_file: prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:klicks_app/api/auth.dart';
import 'package:klicks_app/model/User.dart';
import 'package:klicks_app/static/button.dart';
import 'package:klicks_app/static/icon_button.dart';
import 'package:klicks_app/static/inputfield.dart';
import 'package:klicks_app/static/pass_inputfield_two.dart';
import 'package:klicks_app/static/title_topbar.dart';
import 'package:klicks_app/translations/locale_keys.g.dart';
import 'package:klicks_app/values/colors.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:easy_localization/easy_localization.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();

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
      emailController.text = user!.email!;
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
      backgroundColor: White,
      body: SafeArea(
        child: Column(
          children: [
            TitleTopbar(
              ontap: () {
                Navigator.pop(context);
              },
              text: LocaleKeys.Edit_Profile.tr(),
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
                            LocaleKeys.Username.tr(),
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
                            "Email",
                            style: TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 16),
                          ),
                        ),
                        InputField(
                          readOnly: true,
                          hint: 'Enter Email',
                          controller: emailController,
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 12.0, bottom: 6),
                          child: Text(
                            LocaleKeys.Phone_Number.tr(),
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
                                LocaleKeys.Password.tr(),
                                style: TextStyle(
                                    fontWeight: FontWeight.w500, fontSize: 16),
                              ),
                              InkWell(
                                onTap: () {
                                  ChangePassword(context, user!.email);
                                },
                                child: Text(
                                  LocaleKeys.Change_Password.tr(),
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

          showDialog(
              context: context,
              builder: (BuildContext context) {
                Future.delayed(Duration(seconds: 1), () {
                  Navigator.of(context).pop(true);
                });
                return AlertDialog(
                  // title:
                  content: Container(
                    height: 150,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Image(
                              image: AssetImage('assets/images/checked.png'),
                              height: 50,
                              width: 50),
                        ),
                        SizedBox(height: 12),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Password changed\n successfully!',
                              textAlign: TextAlign.center,
                              maxLines: 2,
                              style: TextStyle(fontSize: 22),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              });
          currentPassword.text = '';
          newPassword.text = '';
          confirmNewPassword.text = '';
        }
      }
    }

    Alert(
        context: context,
        // title: LocaleKeys.Change_Password.tr(),
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 6),
            Text(
              LocaleKeys.Current_Password.tr(),
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
            ),
            SizedBox(height: 4),
            InputField(
              hint: LocaleKeys.Enter_current_password.tr(),
              obscure: true,
              controller: currentPassword,
            ),
            SizedBox(height: 6),
            Text(
              LocaleKeys.New_Password.tr(),
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
            ),
            SizedBox(height: 4),
            InputField(
              hint: LocaleKeys.Enter_new_password.tr(),
              obscure: true,
              controller: newPassword,
            ),
            SizedBox(height: 6),
            Text(
              LocaleKeys.Confirm_New_Password.tr(),
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
            ),
            SizedBox(height: 4),
            InputField(
              hint: LocaleKeys.Enter_confirm_new_password.tr(),
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
              LocaleKeys.Change_Password.tr(),
              style: TextStyle(color: Colors.white, fontSize: 14),
            ),
          )
        ]).show();
  }
}
