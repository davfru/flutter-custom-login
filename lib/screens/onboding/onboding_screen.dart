import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rive/rive.dart';
import 'package:rive_animation/screens/onboding/components/animated_btn.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  late RiveAnimationController _btnAnimationController;

  @override
  void initState() {
    _btnAnimationController = OneShotAnimation("active", autoplay: false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Positioned(
            width: MediaQuery.of(context).size.width * 1.7,
            bottom: 200,
            left: 100,
            child: Image.asset('assets/Backgrounds/Spline.png')),
        Positioned.fill(
            child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 20, sigmaY: 10),
        )),
        const RiveAnimation.asset('assets/RiveAssets/shapes.riv'),
        Positioned.fill(
            child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 20, sigmaY: 10),
          child: const SizedBox(),
        )),
        SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Spacer(),
              const SizedBox(
                width: 260,
                child: Column(children: [
                  Text(
                    "Learn design & code",
                    style: TextStyle(
                        fontSize: 60, fontFamily: "Poppins", height: 1.2),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Text(
                      "Don't skip design. Learn design and code, by builder real apps with Flutter and Swift. Complete courses about best tools.")
                ]),
              ),
              const Spacer(
                flex: 2,
              ),
              AnimatedBtn(
                btnAnimationController: _btnAnimationController,
                press: () {
                  _btnAnimationController.isActive = true;
                },
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 24.0),
                child: Text(
                  "Purchase includes access to 30+ courses, 240+ premium tutorials, 120+ hours of videos, source files and certificates",
                  style: TextStyle(),
                ),
              )
            ]),
          ),
        )
      ],
    ));
  }
}
