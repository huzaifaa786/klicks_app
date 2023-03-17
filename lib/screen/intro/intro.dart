import 'package:flutter/material.dart';
import 'package:klicks_app/screen/intro/fragments/fragment_1.dart';
import 'package:klicks_app/screen/intro/fragments/fragment_2.dart';
import 'package:klicks_app/static/button.dart';
import 'package:klicks_app/values/colors.dart';
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
