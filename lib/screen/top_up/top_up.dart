import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:klicks_app/static/box.dart';
import 'package:klicks_app/static/title_topbar.dart';

class TopUp extends StatefulWidget {
  const TopUp({super.key});

  @override
  State<TopUp> createState() => _TopUpState();
}

class _TopUpState extends State<TopUp> {
  String? Selectedvalue = "AED 10";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Column(
          children: [
            TitleTopbar(
              text: 'Top Up',
              ontap: () {},
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 50,
              ),
              child: Text(
                'Enter the amount of top up',
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 10,
              ),
              child: Container(
                  height: 105,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    color: Colors.white,
                    border: Border.all(width: 1, color: Colors.black),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'AED 10',
                        style: TextStyle(
                            fontSize: 45, fontWeight: FontWeight.w600),
                      ),
                    ],
                  )),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                
                children: [
                  Box(
                    
                    title: 'AED 10',
                    ontap: () {
                      setState(() {
                        Selectedvalue = 'AED 10';
                      });
                    },
                    selected: Selectedvalue == 'AED 10' ? true : false,
                  ),
                  Box(
                    title: 'AED 20',
                    ontap: () {
                      setState(() {
                        Selectedvalue = 'AED 20';
                      });
                    },
                    selected: Selectedvalue == 'AED 20' ? true : false,
                  ),
                  Box(
                    title: 'AED 50',
                    ontap: () {
                      setState(() {
                        Selectedvalue = 'AED 50';
                      });
                    },
                    selected: Selectedvalue == 'AED 50' ? true : false,
                  ),
                  Box(
                    title: 'AED 100',
                    ontap: () {
                      setState(() {
                        Selectedvalue = 'AED 100';
                      });
                    },
                    selected: Selectedvalue == 'AED 100' ? true : false,
                  ),
                ],
              ),
            ),
          ],
        ),
      )),
    );
  }
}
