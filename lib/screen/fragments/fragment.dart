import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:klicks_app/screen/fragments/fragment_1.dart';
import 'package:klicks_app/screen/fragments/fragment_2.dart';
import 'package:klicks_app/screen/fragments/fragment_3.dart';

class Fragment extends StatefulWidget {
  const Fragment({super.key});

  @override
  State<Fragment> createState() => _FragmentState();
}

class _FragmentState extends State<Fragment> {
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
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.53,
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
                      FragmentThree(controller: controller!),
                   
                    ],
                  ),
                ),
                // SizedBox(
                //     width: Get.width * 0.55,
                //     child: StepProgressIndicator(
                      // currentStep: slideIndex + 1,
                //       totalSteps: 6,
                //       selectedColor: primaryColor,
                //       unselectedColor: secondaryColor,
                //       selectedSize: 2,
                //       unselectedSize: 2,
                //       roundedEdges: Radius.circular(3),
                //     )),
                // slideIndex == 0
                //     ? TextFragmentOne()
                //     : slideIndex == 1
                //         ? TextFragmentTwo()
                //         : slideIndex == 2
                //             ? TextFragmentThree()
                //             : slideIndex == 3
                //                 ? TextFragmentFour()
                //                 : slideIndex == 4
                //                     ? TextFragmentFive()
                //                     : TextFragmentSix(),
                // slideIndex == 0
                //     ? Container(
                //         height: MediaQuery.of(context).size.height * .12,
                //         padding: const EdgeInsets.only(right: 25),
                //         child: Align(
                //           alignment: Alignment.bottomRight,
                //           child: Row(
                //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //             children: [
                //               Text(
                //                 '.',
                //                 style: TextStyle(color: white),
                //               ),
                //               SmallIconButton(
                //                 onPressed: () {
                //                   setState(() {
                //                     slideIndex++;
                //                     controller!.animateToPage(slideIndex,
                //                         duration:
                //                             const Duration(milliseconds: 400),
                //                         curve: Curves.ease);
                //                   });
                //                 },
                //                 icon: 'assets/images/forward.svg',
                //               ),
                //             ],
                //           ),
                //         ),
                //       )
                //     : slideIndex == 1
                //         ? Container(
                //             height: MediaQuery.of(context).size.height * .12,
                //             padding: const EdgeInsets.only(right: 25, left: 25),
                //             child: Align(
                //               alignment: Alignment.bottomRight,
                //               child: Row(
                //                 mainAxisAlignment:
                //                     MainAxisAlignment.spaceBetween,
                //                 children: [
                //                   SmallIconButton(
                //                     onPressed: () {
                //                       setState(() {
                //                         slideIndex--;
                //                         controller!.animateToPage(slideIndex,
                //                             duration: const Duration(
                //                                 milliseconds: 400),
                //                             curve: Curves.ease);
                //                       });
                //                     },
                //                   ),
                //                   InkWell(
                //                     onTap: () {
                //                       Get.put(AuthController());
                //                       // Get.to(() => MoreComingScreen());
                //                     },
                //                     child: Text(
                //                       "Skip",
                //                       style: TextStyle(
                //                         decoration: TextDecoration.underline,
                //                         fontSize: 14,
                //                         fontWeight: FontWeight.w400,
                //                       ),
                //                       textAlign: TextAlign.justify,
                //                     ),
                //                   ),
                //                   SmallIconButton(
                //                     onPressed: () {
                //                       setState(() {
                //                         slideIndex++;
                //                         controller!.animateToPage(slideIndex,
                //                             duration: const Duration(
                //                                 milliseconds: 400),
                //                             curve: Curves.ease);
                //                       });
                //                     },
                //                     icon: 'assets/images/forward.svg',
                //                   ),
                //                 ],
                //               ),
                //             ),
                //           )
                //         : slideIndex == 2
                //             ? Container(
                //                 height:
                //                     MediaQuery.of(context).size.height * .12,
                //                 padding:
                //                     const EdgeInsets.only(right: 25, left: 25),
                //                 child: Align(
                //                   alignment: Alignment.bottomRight,
                //                   child: Row(
                //                     mainAxisAlignment:
                //                         MainAxisAlignment.spaceBetween,
                //                     children: [
                //                       SmallIconButton(
                //                         onPressed: () {
                //                           setState(() {
                //                             slideIndex--;
                //                             controller!.animateToPage(
                //                                 slideIndex,
                //                                 duration: const Duration(
                //                                     milliseconds: 400),
                //                                 curve: Curves.ease);
                //                           });
                //                         },
                //                       ),
                //                       InkWell(
                //                         onTap: () {
                //                           Get.put(AuthController());
                //                           // Get.to(() => MoreComingScreen());
                //                         },
                //                         child: Text(
                //                           "Skip",
                //                           style: TextStyle(
                //                             decoration:
                //                                 TextDecoration.underline,
                //                             fontSize: 14,
                //                             fontWeight: FontWeight.w400,
                //                           ),
                //                           textAlign: TextAlign.justify,
                //                         ),
                //                       ),
                //                       SmallIconButton(
                //                         onPressed: () {
                //                           setState(() {
                //                             slideIndex++;
                //                             controller!.animateToPage(
                //                                 slideIndex,
                //                                 duration: const Duration(
                //                                     milliseconds: 400),
                //                                 curve: Curves.ease);
                //                           });
                //                         },
                //                         icon: 'assets/images/forward.svg',
                //                       ),
                //                     ],
                //                   ),
                //                 ),
                //               )
                //             : slideIndex == 3
                //                 ? Container(
                //                     height: MediaQuery.of(context).size.height *
                //                         .12,
                //                     padding: const EdgeInsets.only(
                //                         right: 25, left: 25),
                //                     child: Align(
                //                       alignment: Alignment.bottomRight,
                //                       child: Row(
                //                         mainAxisAlignment:
                //                             MainAxisAlignment.spaceBetween,
                //                         children: [
                //                           SmallIconButton(
                //                             onPressed: () {
                //                               setState(() {
                //                                 slideIndex--;
                //                                 controller!.animateToPage(
                //                                     slideIndex,
                //                                     duration: const Duration(
                //                                         milliseconds: 400),
                //                                     curve: Curves.ease);
                //                               });
                //                             },
                //                           ),
                //                           InkWell(
                //                             onTap: () {
                //                               Get.put(AuthController());
                //                               // Get.to(() => MoreComingScreen());
                //                             },
                //                             child: Text(
                //                               "Skip",
                //                               style: TextStyle(
                //                                 decoration:
                //                                     TextDecoration.underline,
                //                                 fontSize: 14,
                //                                 fontWeight: FontWeight.w400,
                //                               ),
                //                               textAlign: TextAlign.justify,
                //                             ),
                //                           ),
                //                           SmallIconButton(
                //                             onPressed: () {
                //                               setState(
                //                                 () {
                //                                   slideIndex++;
                //                                   controller!.animateToPage(
                //                                     slideIndex,
                //                                     duration: const Duration(
                //                                         milliseconds: 400),
                //                                     curve: Curves.ease,
                //                                   );
                //                                 },
                //                               );
                //                             },
                //                             icon: 'assets/images/forward.svg',
                //                           ),
                //                         ],
                //                       ),
                //                     ),
                //                   )
                //                 : slideIndex == 4
                //                     ? Container(
                //                         height:
                //                             MediaQuery.of(context).size.height *
                //                                 .12,
                //                         padding: const EdgeInsets.only(
                //                             right: 25, left: 25),
                //                         child: Align(
                //                           alignment: Alignment.bottomRight,
                //                           child: Row(
                //                             mainAxisAlignment:
                //                                 MainAxisAlignment.spaceBetween,
                //                             children: [
                //                               SmallIconButton(
                //                                 onPressed: () {
                //                                   setState(
                //                                     () {
                //                                       slideIndex--;
                //                                       controller!.animateToPage(
                //                                           slideIndex,
                //                                           duration:
                //                                               const Duration(
                //                                                   milliseconds:
                //                                                       400),
                //                                           curve: Curves.ease);
                //                                     },
                //                                   );
                //                                 },
                //                               ),
                //                               InkWell(
                //                                 onTap: () {
                //                                   Get.put(AuthController());
                //                                   // Get.to(() => MoreComingScreen());
                //                                 },
                //                                 child: Text(
                //                                   "Skip",
                //                                   style: TextStyle(
                //                                     decoration: TextDecoration
                //                                         .underline,
                //                                     fontSize: 14,
                //                                     fontWeight: FontWeight.w400,
                //                                   ),
                //                                   textAlign: TextAlign.justify,
                //                                 ),
                //                               ),
                //                               SmallIconButton(
                //                                 icon:
                //                                     'assets/images/forward.svg',
                //                                 onPressed: () {
                //                                   setState(
                //                                     () {
                //                                       slideIndex++;
                //                                       controller!.animateToPage(
                //                                           slideIndex,
                //                                           duration:
                //                                               const Duration(
                //                                                   milliseconds:
                //                                                       400),
                //                                           curve: Curves.ease);
                //                                     },
                //                                   );
                //                                 },
                //                                 color: secondaryColor,
                //                               )
                //                             ],
                //                           ),
                //                         ),
                //                       )
                //                     : Container(
                //                         height:
                //                             MediaQuery.of(context).size.height *
                //                                 .12,
                //                         padding: const EdgeInsets.only(
                //                             right: 25, left: 25),
                //                         child: Align(
                //                           alignment: Alignment.bottomCenter,
                //                           child: InkWell(
                //                             onTap: () {
                //                               setState(
                //                                 () {
                //                                   slideIndex--;
                //                                   controller!.animateToPage(
                //                                       slideIndex,
                //                                       duration: const Duration(
                //                                           milliseconds: 400),
                //                                       curve: Curves.ease);
                //                                 },
                //                               );
                //                             },
                //                             child: Text(
                //                               "Go Back",
                //                               style: TextStyle(
                //                                 decoration:
                //                                     TextDecoration.underline,
                //                                 fontSize: 14,
                //                                 fontWeight: FontWeight.w400,
                //                               ),
                //                               textAlign: TextAlign.justify,
                //                             ),
                //                           ),
                //                         ),
                //                       ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
