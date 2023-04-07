import 'package:flutter/material.dart';
import 'package:klicks_app/screen/order_history/search_method.dart';
import 'package:klicks_app/static/button.dart';
import 'package:klicks_app/translations/locale_keys.g.dart';
import 'package:klicks_app/values/colors.dart';
import 'package:easy_localization/easy_localization.dart';
import 'dart:ui' as ui;

class SearchSheet extends StatefulWidget {
  const SearchSheet({Key? key}) : super(key: key);
  @override
  State<SearchSheet> createState() => _SearchSheetState();
}

enum Searchmethod { all, completed, inprogess, rejected }

class _SearchSheetState extends State<SearchSheet> {
  Searchmethod _site = Searchmethod.all;
  void toggleplan(Searchmethod value) {
    setState(() {
      _site = value;
      query = value.toString();
      print(query);
    });
  }

  late String query;

  @override
  void initState() {
    super.initState();
    query = 'Searchmethod.all';
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: ui.TextDirection.ltr,
      child: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 6),
              child: Text(
                LocaleKeys.filter_by.tr(),
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
              ),
            ),
            SearchMethod(
              title: LocaleKeys.All.tr(),
              groupvalue: _site,
              color: mainColor,
              value: Searchmethod.all,
              onchaged: () {
                toggleplan(Searchmethod.all);
              },
            ),
            SearchMethod(
              title: LocaleKeys.Completed.tr(),
              groupvalue: _site,
              color: badgeGreen,
              value: Searchmethod.completed,
              onchaged: () {
                toggleplan(Searchmethod.completed);
              },
            ),
            SearchMethod(
              title: LocaleKeys.In_progress.tr(),
              value: Searchmethod.inprogess,
              color: InprocessColor,
              groupvalue: _site,
              onchaged: () {
                toggleplan(Searchmethod.inprogess);
              },
              onpress: () {},
            ),
            SearchMethod(
              title: LocaleKeys.Rejected.tr(),
              color: Colors.red,
              groupvalue: _site,
              value: Searchmethod.rejected,
              onchaged: () {
                toggleplan(Searchmethod.rejected);
              },
            ),
            Padding(
              padding: const EdgeInsets.only(top: 14),
              child: LargeButton(
                  title: LocaleKeys.Apply.tr(),
                  onPressed: () {
                    Navigator.pop(context, query);
                  }),
            )
          ],
        ),
      ),
    );
  }
}
