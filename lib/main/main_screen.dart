import 'package:flutter/material.dart';
import 'package:klicks_app/static/dropdown.dart';
import 'package:klicks_app/static/topbar.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Topbar(),
              Padding(
                padding: EdgeInsets.only(top: 20, bottom: 8),
                child: Text(
                  "Hello, Amal!",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 24,
                  ),
                ),
              ),
              Text(
                "Tuesday, January 3rd",
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 30),
                child: Image(
                  image: AssetImage(
                    'assets/images/car_wash.jpg',
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20.0),
                child: Text(
                  "Select Location",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 15,
                  ),
                ),
              ),
              DropdownField(
                // imageIcon: Icons.location_on_outlined,
                // selectedvalue: '',
                text: "Choose City",
                items: ["1", "2"],
                icon: ImageIcon(AssetImage('assets/images/drop_arrow.png')),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20.0),
                child: Text(
                  "Select Location",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 15,
                  ),
                ),
              ),
              DropdownField(
                // imageIcon: Icons.home,
                // selectedvalue: '',
                text: "Choose Mall",
                items: ["1", "2"],
                icon: ImageIcon(AssetImage('assets/images/drop_arrow.png')),
              )
            ],
          ),
        ),
      ),
    );
  }
}
