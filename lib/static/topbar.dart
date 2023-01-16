// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Topbar extends StatelessWidget {
  const Topbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 5.0, right: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Image(
            image: AssetImage(
              'assets/images/logo1.png',
            ),
            height: 63,
            width: 63,
          ),
          GestureDetector(
            onTap: (){
              Navigator.pushNamed(context, 'notification');
            },
            child: SvgPicture.asset('assets/images/bell.svg'),
          )
        ],
      ),
    );
  }
}
