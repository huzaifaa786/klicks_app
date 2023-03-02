import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:klicks_app/api/auth.dart';
import 'package:klicks_app/static/icon_inputfield.dart';
import 'package:klicks_app/static/order.dart';
import 'package:klicks_app/static/searchbar.dart';
import 'package:klicks_app/static/title_topbar.dart';

class OrderHistry extends StatefulWidget {
  const OrderHistry({super.key});

  @override
  State<OrderHistry> createState() => _OrderHistryState();
}
getorder(){
 getuser() async {
    var muser = await AuthApi.getuser();
  
  }

}

void initState() {
    super.initState();
  WidgetsBinding.instance.addPostFrameCallback((_) async {
    getorder();
  });
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
