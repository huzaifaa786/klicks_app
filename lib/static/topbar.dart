import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Topbar extends StatelessWidget {
  const Topbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Image(
          image: AssetImage(
            'assets/images/logo1.png',
          ),
          height: 63,
          width: 63,
        ),
        SvgPicture.asset('assets/images/bell.svg')
      ],
    );
  }
}
