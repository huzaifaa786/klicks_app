import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:klicks_app/static/title_topbar.dart';

class TopUp extends StatefulWidget {
  const TopUp({super.key});

  @override
  State<TopUp> createState() => _TopUpState();
}

class _TopUpState extends State<TopUp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          TitleTopbar(
            text: 'Top Up',
            ontap: () {},
          ),
          Padding(
            padding: const EdgeInsets.only(top: 50, left: 20),
            child: Text(
              'Enter the amount of top up',
              style: TextStyle(fontSize: 15),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10,right: 20,left: 20),
            child: Container(

              height: 105,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6),
                          color: Colors.white,
                            border: Border.all(width: 2, color: Colors.black),
                        ),
            ),
          )
        ],
      )),
    );
  }
}
