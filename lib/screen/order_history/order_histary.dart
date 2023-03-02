import 'package:flutter/material.dart';
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
          child: Column(
        children: [
          TitleTopbar(
            text: 'Order History',
            ontap: () {
              Navigator.popAndPushNamed(context, 'home');
            },
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20, right: 20, left: 20),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: SearchBar(
                    imageIcon: 'assets/images/search.png',
                    hint: 'search',
                  ),
                ),
                SizedBox(height: 20),
                Order(
                  imageicon: 'assets/images/car_order.svg',
                  ontap: () {
                    Navigator.pushNamed(context, 'order_status');
                  },
                ),
              ],
            ),
          ),
        ],
      )),
    );
  }
}
