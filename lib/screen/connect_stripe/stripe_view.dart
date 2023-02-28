// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_stripe/flutter_stripe.dart';

// class PaymentScreen extends StatefulWidget {
//   @override
//   _PaymentScreenState createState() => _PaymentScreenState();
// }

// class _PaymentScreenState extends State<PaymentScreen> {
//   PaymentMethod paymentMethod;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Payment"),
//       ),
//       body: Column(
//         children: [
//           CardField(
//             onCardChanged: (card) {
//               // Handle card changes
//             },
//           ),
//           ElevatedButton(
//             onPressed: () async {
//               final paymentMethod = await Stripe.instance.createPaymentMethod(
//                 PaymentMethodParams.card(
//                   billingDetails: BillingDetails(
//                     name: "John Doe",
//                   ),
//                 ),
//               );
//               setState(() {
//                 this.paymentMethod = paymentMethod;
//               });
//               final paymentIntent = await Stripe.instance.confirmPaymentIntent(
//                 PaymentIntentParams(
//                   paymentMethodId: paymentMethod.id,
//                   amount: 1099,
//                   currency: "usd",
//                 ),
//               );
//               // Handle payment result
//             },
//             child: Text("Pay"),
//           ),
//         ],
//       ),
//     );
//   }
// }
