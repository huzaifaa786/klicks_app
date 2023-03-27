// ignore_for_file: prefer_const_constructors, unused_element

import 'package:flutter/material.dart';
import 'package:klicks_app/api/auth.dart';
import 'package:klicks_app/model/User.dart';
import 'package:klicks_app/screen/edit_profile.dart/edit_model.dart';
import 'package:klicks_app/static/inputfield.dart';
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
      phoneController.text = user!.phone.toString();
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
            user != null?
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
                        user!.type != 'google'
                            ? Padding(
                                padding: EdgeInsets.only(top: 12.0, bottom: 6),
                                child: Text(
                                  LocaleKeys.Phone_Number.tr(),
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16),
                                ),
                              )
                            : Container(),
                        user!.type != 'google'
                            ? InputField(
                                readOnly: true,
                                hint: 'Enter phone number',
                                controller: phoneController,
                                type: TextInputType.number,
                              )
                            : Container(),
                        user!.type != 'google'
                            ? Padding(
                                padding: EdgeInsets.only(top: 12.0, bottom: 6),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      LocaleKeys.Password.tr(),
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 16),
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
                              )
                            : Container()
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
                )
              ),
            ):Container()
          ],
        ),
      ),
    );
  }

  ChangePassword(context, email) {
    Alert(context: context, content: EditModel(email: email), buttons: [
      DialogButton(
          height: 0, color: White, onPressed: () async {}, child: Text(''))
    ]).show();
  }
}
