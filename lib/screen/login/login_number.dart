import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:klicks_app/static/button.dart';
import 'package:klicks_app/static/icon_inputfield.dart';
import 'package:klicks_app/values/colors.dart';
import 'package:toggle_switch/toggle_switch.dart';

class Numlogin extends StatefulWidget {
  const Numlogin({super.key});

  @override
  State<Numlogin> createState() => _NumloginState();
}

class _NumloginState extends State<Numlogin> {
  
  TextEditingController phoneController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 30, right: 30),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.97,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        child: Column(
                          children: [
                            Stack(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image(
                                      image: AssetImage(
                                        'assets/images/logo1.png',
                                      ),
                                      height: 220,
                                      width: 220,
                                    ),
                                  ],
                                ),
                                // Positioned(
                                //   bottom: 10,
                                //   left: 55,
                                //   child: Text(
                                //     "Sign in to continue",
                                //     style: TextStyle(
                                //       fontSize: 26,
                                //       fontWeight: FontWeight.w600,
                                //     ),
                                //   ),
                                // )
                              ],
                            ),
                            Text(
                              "Sign in to continue",
                              style: TextStyle(
                                fontSize: 26,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 40),
                              child: Row(
                                children: [
                                  ToggleSwitch(
                                    initialLabelIndex: 0,
                                    inactiveBgColor: Color.fromARGB(255, 233, 232, 232),
                                    minWidth: 170,
                                    minHeight: 60,
                                    totalSwitches: 2,
                                    labels: ['Email', 'OTP'],
                                    onToggle: (index) {
                                     
                                    },
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 30),
                              child: Row(
                                children: [
                                  Text(
                                    "Enter Phone Number",
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 20),
                              child: IntlPhoneField(
                                controller: phoneController,
                                decoration: const InputDecoration(
                                  filled: true,
                                  fillColor: fieldColor,
                                  border: InputBorder.none,
                                ),
                                initialCountryCode: 'AE',
                                onChanged: (phone) {},
                                keyboardType: TextInputType.phone,
                              ),
                            ),
                            Text(
                                'By continuing you may an SMS for\n verification massage and data may\n apply',
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.grey,
                                  fontWeight: FontWeight.w500,
                                )),
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 25.0, bottom: 30),
                              child: LargeButton(
                                title: "Send Otp",
                                onPressed: () {},
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
  
}
