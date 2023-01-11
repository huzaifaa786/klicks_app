import 'package:flutter/material.dart';
import 'package:klicks_app/values/colors.dart';

class BookingConfirm extends StatefulWidget {
  const BookingConfirm({super.key});

  @override
  State<BookingConfirm> createState() => _BookingConfirmState();
}

class _BookingConfirmState extends State<BookingConfirm> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainColor,
      body: SafeArea(
        child: Container(
          width: MediaQuery.of(context).size.width,         padding: EdgeInsets.only(top: 224),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
          const Image(
                image: AssetImage(
                  'assets/images/Vector.png',
                ),
              ),
              Padding(
                  padding: EdgeInsets.only(top: 24,),
                  child: Text(
                    'Booking Confirmed!',
                    style: TextStyle(color: Colors.white, fontSize: 24 ),
                  )),
                  Padding(padding: EdgeInsets.only(top: 8),
                  
                 child: Text('Your order has been placed successfully.', style: TextStyle(color: Colors.white),), ),
                  Text('Order Tracking Id: #2344',style: TextStyle(color: Colors.white),)
                
            ],
          ),
        ),
      ),
    );
  }
}
