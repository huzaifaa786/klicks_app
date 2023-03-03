import 'package:flutter/material.dart';
import 'package:klicks_app/api/auth.dart';
import 'package:klicks_app/model/Order.dart';
import 'package:klicks_app/screen/order_status/order_status.dart';
import 'package:klicks_app/static/order.dart';
import 'package:klicks_app/static/searchbar.dart';
import 'package:klicks_app/static/title_topbar.dart';

class OrderHistry extends StatefulWidget {
  const OrderHistry({super.key});

  @override
  State<OrderHistry> createState() => _OrderHistryState();
}

class _OrderHistryState extends State<OrderHistry> {
  List<OrderModal> orders = [];
  List<OrderModal> SearchOrders = [];
  getOrders() async {
    print('sdsb');
    var morder = await AuthApi.getorder();
    setState(() {
      orders = [];
      orders = morder;
      SearchOrders = orders;
    });
  }

  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      getOrders();
    });
  }

  List<String> monthNames = [
    '',
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'October',
    'November',
    'December',
  ];

  void searchOrders(String query) {
    setState(() {
      if (query == '') {
        SearchOrders = orders;
      } else {
        SearchOrders = orders
            .where((o) =>
                o.dateTime!.toString().contains(query.toLowerCase()) ||
                o.cartype!.toLowerCase().contains(query.toLowerCase()) ||
                o.id!.toString().contains(query.toLowerCase()))
            .toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          TitleTopbar(
            text: 'Order History',
            ontap: () {
              Navigator.pop(context);
            },
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20, right: 20, left: 20),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: SearchBar(
                    onChange: searchOrders,
                    imageIcon: 'assets/images/search.png',
                    hint: 'search',
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  height: MediaQuery.of(context).size.height * 0.70,
                  child: ListView.builder(
                      itemCount: SearchOrders.length,
                      itemBuilder: (BuildContext context, int index) {
                        // int i = index + 1;
                        String monthName =
                            monthNames[SearchOrders[index].dateTime!.month];
                        return Order(
                          orderId: SearchOrders[index].id.toString(),
                          companyname: SearchOrders[index].company,
                          cartype: SearchOrders[index].cartype,
                          dateTime: monthName +
                              ' ' +
                              SearchOrders[index].dateTime!.day.toString() +
                              ', ' +
                              SearchOrders[index].dateTime!.year.toString(),
                          type: SearchOrders[index].cartype,
                          ontap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => OrderStatus(
                                        order: SearchOrders[index])));
                          },
                        );
                      }),
                ),
              ],
            ),
          ),
        ],
      )),
    );
  }
}
