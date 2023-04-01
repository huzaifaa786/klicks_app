import 'package:flutter/material.dart';
import 'package:klicks_app/api/auth.dart';
import 'package:klicks_app/model/Order.dart';
import 'package:klicks_app/screen/login/login.dart';
import 'package:klicks_app/screen/order_history/search_sheet.dart';
import 'package:klicks_app/screen/order_status/order_status.dart';
import 'package:klicks_app/static/button.dart';
import 'package:klicks_app/static/order.dart';
import 'package:klicks_app/static/searchbar.dart';
import 'package:klicks_app/static/title_topbar.dart';
import 'package:klicks_app/translations/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:klicks_app/values/colors.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OrderHistry extends StatefulWidget {
  const OrderHistry({super.key});

  @override
  State<OrderHistry> createState() => _OrderHistryState();
}

class _OrderHistryState extends State<OrderHistry> {
  List<OrderModal> orders = [];
  List<OrderModal> SearchOrders = [];
  String? query;
  String? authCheck;
  bool search = false;

  getOrders() async {
    final prefs = await SharedPreferences.getInstance();
    authCheck = prefs.getString('api_token');
    if (authCheck != null) {
      var morder = await AuthApi.getorder();
      setState(() {
        orders = [];
        orders = morder;
        SearchOrders = orders;
        search = true;
      });
    } else {
      setState(() {
        search = true;
      });
    }
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
                o.id!.toString().contains(query.toLowerCase()) ||
                o.company!.toLowerCase().contains(query.toLowerCase()))
            .toList();
      }
    });
  }

  void filterOrder(String query) {
    setState(() {
      if (query == 'Searchmethod.all') {
        SearchOrders = orders;
        print(query);
      } else if (query == 'Searchmethod.completed') {
        SearchOrders = orders.where((i) => i.status == 3).toList();
        print(query);
      } else if (query == 'Searchmethod.inprogess') {
        SearchOrders =
            orders.where((i) => i.status == 0 || i.status == 1).toList();
        print(query);
      } else if (query == 'Searchmethod.rejected') {
        SearchOrders = orders.where((i) => i.status == 2).toList();
        print(query);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: White,
      body: SafeArea(
          child: Column(
        children: [
          TitleTopbar(
            text: LocaleKeys.Order_History.tr(),
            ontap: () {
              Navigator.pop(context);
            },
          ),
          search != false
              ? authCheck != null
                  ? Padding(
                      padding:
                          const EdgeInsets.only(top: 20, right: 20, left: 20),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 20),
                            child: SearchBar(
                              onChange: searchOrders,
                              imageIcon: 'assets/images/search.png',
                              hint: LocaleKeys.search.tr(),
                              ontap: () async {
                                query = await showModalBottomSheet(
                                  context: context,
                                  isScrollControlled: true,
                                  shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.vertical(
                                      top: Radius.circular(40),
                                    ),
                                  ),
                                  builder: (context) => Wrap(
                                      // ignore: prefer_const_literals_to_create_immutables
                                      children: [SearchSheet()]),
                                );
                                if (query != null) {
                                  filterOrder(query!);
                                }
                              },
                            ),
                          ),
                          SizedBox(height: 13.6),
                          Container(
                            height: MediaQuery.of(context).size.height * 0.70,
                            child: ListView.builder(
                                itemCount: SearchOrders.length,
                                itemBuilder: (BuildContext context, int index) {
                                  // int i = index + 1;
                                  String monthName = monthNames[
                                      SearchOrders[index].dateTime!.month];
                                  return Order(
                                    orderId: SearchOrders[index].id.toString(),
                                    price: SearchOrders[index].price,
                                    cartype: SearchOrders[index].cartype,
                                    dateTime: monthName +
                                        ' ' +
                                        SearchOrders[index]
                                            .dateTime!
                                            .day
                                            .toString() +
                                        ', ' +
                                        SearchOrders[index]
                                            .dateTime!
                                            .year
                                            .toString(),
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
                    )
                  : Container(
                      padding:
                          const EdgeInsets.only(left: 14, right: 14, top: 12),
                      height: MediaQuery.of(context).size.height * 0.8,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width * 0.76,
                            padding: const EdgeInsets.only(bottom: 12),
                            child: Text(
                              LocaleKeys.to_see_order.tr(),
                              textAlign: TextAlign.center,
                              maxLines: 2,
                            ),
                          ),
                          LargeButton(
                              screenRatio: 0.8,
                              title: LocaleKeys.Sign_in.tr(),
                              onPressed: () {
                                Navigator.of(context)
                                    .pushReplacement(new MaterialPageRoute(
                                        builder: (context) => new LoginScreen(
                                              nextScreen: 'any',
                                            )));
                              })
                        ],
                      ))
              : Container(),
        ],
      )),
    );
  }
}
