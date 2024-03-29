import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MainScreenText extends StatelessWidget {
  const MainScreenText({super.key, this.image, this.text});
  final image;
  final text;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 4),
          child: Container(
            padding: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 224, 240, 255),
              borderRadius: BorderRadius.circular(15),
            ),
            child: FittedBox(
              fit: BoxFit.scaleDown,
              child: SvgPicture.asset(
                image,
                height: 17,
                width: 17,
              ),
            ),
          ),
        ),
        Text(
          text,
          style: TextStyle(
              fontWeight: FontWeight.w500, fontSize: 16, fontFamily: 'Poppins'),
        ),
      ],
    );
  }
}
