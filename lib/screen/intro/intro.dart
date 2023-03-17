// // ignore_for_file: prefer_const_constructors

// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:klicks_app/screen/intro/fragments/fragment_1.dart';
// import 'package:klicks_app/screen/intro/fragments/fragment_2.dart';
// import 'package:klicks_app/screen/intro/fragments/fragment_3.dart';
// import 'package:klicks_app/values/colors.dart';
// import 'package:smooth_page_indicator/smooth_page_indicator.dart';

// class IntroScreen extends StatefulWidget {
//   const IntroScreen({super.key});

//   @override
//   State<IntroScreen> createState() => _IntroScreenState();
// }

// class _IntroScreenState extends State<IntroScreen> {
//   int slideIndex = 0;
//   PageController? controller;

//   @override
//   void initState() {
//     super.initState();
//     controller = PageController();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: SizedBox(
//           height: MediaQuery.of(context).size.height,
//           child: SingleChildScrollView(
//             child: Column(
//               children: [
//                 slideIndex == 0
//                     ? Padding(
//                         padding: const EdgeInsets.all(20.0),
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.end,
//                           children: [
//                             GestureDetector(
//                               onTap: () {
//                                 Navigator.pushNamed(context, 'login');
//                               },
//                               child:
//                                   Text("Skip", style: TextStyle(fontSize: 16)),
//                             )
//                           ],
//                         ),
//                       )
//                     : slideIndex == 1
//                         ? Padding(
//                             padding: const EdgeInsets.all(20.0),
//                             child: Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                               children: [
//                                 GestureDetector(
//                                     onTap: () {
//                                       setState(() {
//                                         slideIndex--;
//                                         controller!.animateToPage(slideIndex,
//                                             duration: const Duration(
//                                                 milliseconds: 400),
//                                             curve: Curves.ease);
//                                       });
//                                     },
//                                     child: SvgPicture.asset(
//                                         'assets/images/backArrow.svg')),
//                                 GestureDetector(
//                                   onTap: () {
//                                     Navigator.pushNamed(context, 'login');
//                                   },
//                                   child: Text("Skip",
//                                       style: TextStyle(fontSize: 16)),
//                                 ),
//                               ],
//                             ),
//                           )
//                         : Padding(
//                             padding: const EdgeInsets.all(20.0),
//                             child: Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                               children: [
//                                 GestureDetector(
//                                     onTap: () {
//                                       setState(() {
//                                         slideIndex--;
//                                         controller!.animateToPage(slideIndex,
//                                             duration: const Duration(
//                                                 milliseconds: 400),
//                                             curve: Curves.ease);
//                                       });
//                                     },
//                                     child: SvgPicture.asset(
//                                         'assets/images/backArrow.svg')),
//                                 Text('')
//                               ],
//                             ),
//                           ),
//                 SizedBox(
//                   height: MediaQuery.of(context).size.height * 0.6,
//                   child: PageView(
//                     controller: controller,
//                     onPageChanged: (index) {
//                       setState(() {
//                         slideIndex = index;
//                       });
//                     },
//                     children: <Widget>[
//                       FragmentOne(controller: controller!),
//                       FragmentTwo(controller: controller!),
//                       FragmentThree(controller: controller!),
//                     ],
//                   ),
//                 ),
//                 SizedBox(
//                   height: MediaQuery.of(context).size.height * 0.07,
//                   child: SmoothPageIndicator(
//                     controller: controller!, // PageController
//                     count: 3,
//                     effect: ExpandingDotsEffect(
//                       activeDotColor: mainColor,
//                       dotHeight: 8,
//                       dotWidth: 8,
//                     ),
//                     onDotClicked: (index) {},
//                   ),
//                 ),
//                 slideIndex == 0
//                     ? SizedBox(
//                         height: MediaQuery.of(context).size.height * 0.20,
//                         child: Padding(
//                           padding: const EdgeInsets.only(right: 20, left: 20),
//                           child: Align(
//                             alignment: Alignment.bottomRight,
//                             child: Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                               children: [
//                                 Text(''),
//                                 GestureDetector(
//                                   onTap: () {
//                                     setState(() {
//                                       setState(() {
//                                         slideIndex++;
//                                         controller!.animateToPage(slideIndex,
//                                             duration: const Duration(
//                                                 milliseconds: 400),
//                                             curve: Curves.ease);
//                                       });
//                                     });
//                                   },
//                                   child: Row(
//                                     mainAxisAlignment: MainAxisAlignment.start,
//                                     children: [
//                                       Text(
//                                         "Next",
//                                         style: TextStyle(
//                                             color: mainColor, fontSize: 16),
//                                       ),
//                                       SizedBox(width: 8),
//                                       FittedBox(
//                                         fit: BoxFit.scaleDown,
//                                         child: SvgPicture.asset(
//                                           'assets/images/arrowfor.svg',
//                                           height: 16,
//                                           width: 16,
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ),
//                       )
//                     : slideIndex == 1
//                         ? SizedBox(
//                             height: MediaQuery.of(context).size.height * 0.20,
//                             child: Padding(
//                               padding:
//                                   const EdgeInsets.only(right: 20, left: 20),
//                               child: Align(
//                                 alignment: Alignment.bottomRight,
//                                 child: Row(
//                                   mainAxisAlignment:
//                                       MainAxisAlignment.spaceBetween,
//                                   children: [
//                                     Text(''),
//                                     GestureDetector(
//                                       onTap: () {
//                                         setState(() {
//                                           setState(() {
//                                             slideIndex++;
//                                             controller!.animateToPage(
//                                                 slideIndex,
//                                                 duration: const Duration(
//                                                     milliseconds: 400),
//                                                 curve: Curves.ease);
//                                           });
//                                         });
//                                       },
//                                       child: Row(
//                                         mainAxisAlignment:
//                                             MainAxisAlignment.start,
//                                         children: [
//                                           Text(
//                                             "Next",
//                                             style: TextStyle(
//                                                 color: mainColor, fontSize: 16),
//                                           ),
//                                           SizedBox(width: 8),
//                                           FittedBox(
//                                             fit: BoxFit.scaleDown,
//                                             child: SvgPicture.asset(
//                                               'assets/images/arrowfor.svg',
//                                               height: 16,
//                                               width: 16,
//                                             ),
//                                           ),
//                                         ],
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             ),
//                           )
//                         : SizedBox(
//                             height: MediaQuery.of(context).size.height * 0.20,
//                             child: Padding(
//                               padding:
//                                   const EdgeInsets.only(right: 20, left: 20),
//                               child: Align(
//                                 alignment: Alignment.bottomRight,
//                                 child: Row(
//                                   mainAxisAlignment:
//                                       MainAxisAlignment.spaceBetween,
//                                   children: [
//                                     Text(''),
//                                     GestureDetector(
//                                       onTap: () {
//                                         Navigator.pushNamed(context, 'login');
//                                       },
//                                       child: Row(
//                                         mainAxisAlignment:
//                                             MainAxisAlignment.start,
//                                         children: [
//                                           Text(
//                                             "Finish",
//                                             style: TextStyle(
//                                                 color: mainColor, fontSize: 16),
//                                           ),
//                                           SizedBox(width: 8),
//                                           FittedBox(
//                                             fit: BoxFit.scaleDown,
//                                             child: SvgPicture.asset(
//                                               'assets/images/arrowfor.svg',
//                                               height: 16,
//                                               width: 16,
//                                             ),
//                                           ),
//                                         ],
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             ),
//                           )
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:klicks_app/screen/intro/fragments/fragment_1.dart';
import 'package:klicks_app/screen/intro/fragments/fragment_2.dart';
import 'package:klicks_app/screen/intro/fragments/fragment_3.dart';
import 'package:klicks_app/static/button.dart';
import 'package:klicks_app/values/colors.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  int slideIndex = 0;
  PageController? controller;

  @override
  void initState() {
    super.initState();
    controller = PageController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                    height: MediaQuery.of(context).size.height * 0.1,
                    width: MediaQuery.of(context).size.width * 0.8,
                    child: StepProgressIndicator(
                      currentStep: slideIndex + 1,
                      totalSteps: 2,
                      selectedColor: mainColor,
                      unselectedColor: grey,
                      selectedSize: 3,
                      unselectedSize: 3,
                      roundedEdges: Radius.circular(45),
                    )),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.65,
                  child: PageView(
                    controller: controller,
                    onPageChanged: (index) {
                      setState(() {
                        slideIndex = index;
                      });
                    },
                    children: <Widget>[
                      FragmentOne(controller: controller!),
                      FragmentTwo(controller: controller!),
                    ],
                  ),
                ),
                slideIndex == 0
                    ? LargeButton(
                        screenRatio: 0.75,
                        title: "NEXT",
                        onPressed: () {
                          setState(() {
                            setState(() {
                              slideIndex++;
                              controller!.animateToPage(slideIndex,
                                  duration: const Duration(milliseconds: 400),
                                  curve: Curves.ease);
                            });
                          });
                        },
                      )
                    : LargeButton(
                        screenRatio: 0.75,
                        title: "GET STARTED",
                        onPressed: () {
                          Navigator.popAndPushNamed(context, 'login');
                        },
                      ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
