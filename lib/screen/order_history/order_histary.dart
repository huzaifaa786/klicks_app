import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:klicks_app/static/icon_inputfield.dart';
import 'package:klicks_app/static/order.dart';
import 'package:klicks_app/static/searchbar.dart';
import 'package:klicks_app/static/title_topbar.dart';

class OrderHistry extends StatefulWidget {
  const OrderHistry({super.key});

  @override
  State<OrderHistry> createState() => _OrderHistryState();
}

class _OrderHistryState extends State<OrderHistry> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.only(top: 20, right: 20, left: 20),
        child: Column(
          children: [
            TitleTopbar(
              text: 'Order History',
              ontap: () {},
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: SearchBar(
                imageIcon: 'assets/images/search.png',
                hint: 'search',
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Order(
                imageicon: 'assets/images/car_order.svg',
              ),
            ),
             Order(
              imageicon: 'assets/images/car_order.svg',
            ),
             Order(
              imageicon: 'assets/images/car_order.svg',
            ),
             Order(
              imageicon: 'assets/images/car_order.svg',
            ),
          ],
        ),
      )),
    );
  }
}
