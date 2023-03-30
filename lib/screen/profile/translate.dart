import 'package:flutter/material.dart';
import 'package:klicks_app/model/lang.dart';
import 'package:klicks_app/screen/profile/translate_method.dart';
import 'package:klicks_app/static/title_topbar.dart';
import 'package:easy_localization/easy_localization.dart';

class TranslateScreen extends StatefulWidget {
  const TranslateScreen({super.key, this.lang});

  final String? lang;

  @override
  State<TranslateScreen> createState() => _TranslateScreenState();
}

enum translateMethod { English, Arabic }

class _TranslateScreenState extends State<TranslateScreen> {
  translateMethod _site = translateMethod.English;
  toggleplan(translateMethod value) {
    setState(() {
      _site = value;
    });
  }

  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      BuildContext parentContext = context;
      _site = parentContext.locale.toString() == 'en'
          ? translateMethod.English
          : translateMethod.Arabic;
      setState(() {});
      print(parentContext.locale.toString());
      print(_site);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          TitleTopbar(
            ontap: () {
              Navigator.pop(context);
            },
            text: 'Change Language',
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Column(
              children: [
                TranslateMethod(
                  title: 'English',
                  groupvalue: _site,
                  value: translateMethod.English,
                  onchaged: () async {
                    await toggleplan(translateMethod.English);
                    setState(() {
                      context.setLocale(Language.all[0]);
                    });
                    Navigator.popAndPushNamed(context, 'home');
                  },
                ),
                TranslateMethod(
                  title: 'Arabic',
                  groupvalue: _site,
                  value: translateMethod.Arabic,
                  onchaged: () async {
                    await toggleplan(translateMethod.Arabic);
                    setState(() {
                      context.setLocale(Language.all[1]);
                    });
                    Navigator.popAndPushNamed(context, 'home');
                  },
                ),
              ],
            ),
          )
        ],
      )),
    );
  }
}
