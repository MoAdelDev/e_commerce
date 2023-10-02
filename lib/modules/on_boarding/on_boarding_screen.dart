import 'dart:ui';

import 'package:e_commerce_app/core/route/route_string.dart';
import 'package:e_commerce_app/core/style/components/default_animation.dart';
import 'package:e_commerce_app/core/style/components/default_material_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rive/rive.dart';

import '../../generated/l10n.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Positioned(
              bottom: 200,
              left: 100,
              width: MediaQuery.sizeOf(context).width * 1.7,
              child: Image.asset('assets/images/Spline.png'),
            ),
            const RiveAnimation.asset('assets/rive/shapes.riv'),
            Positioned.fill(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 30, sigmaY: 30),
                child: const SizedBox(),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 30.0,
                    vertical: 70.0,
                  ).r,
                  child: SizedBox(
                    child: DefaultAnimation(
                      animationDirection: AnimationDirection.left,
                      milliseconds: 3000,
                      child: Text(
                        S.of(context).onBoardingTitle,
                        style: TextStyle(
                          fontSize: 50.0.sp,
                          fontFamily: "poppins",
                          height: 1.2,
                        ),
                      ),
                    ),
                  ),
                ),
                const Spacer(),
                DefaultAnimation(
                  animationDirection: AnimationDirection.left,
                  milliseconds: 4000,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10.0, vertical: 30.0),
                    child: DefaultButton(
                      onPressed: () => Navigator.pushNamed(
                        context,
                        RouteConst.loginScreen,
                      ),
                      text: S.of(context).continueTitle,
                      icon: Icons.arrow_forward_ios,
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
