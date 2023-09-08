import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:new_app/shared/styles/colors.dart';
import 'package:page_transition/page_transition.dart';

import '../layout/new_app.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      backgroundColor: AppColors.white,
      splash: InitScreen(),
      nextScreen: LayoutScreen(),
      duration: 3000,
      splashIconSize: 330,
      splashTransition: SplashTransition.fadeTransition,
      pageTransitionType: PageTransitionType.leftToRightWithFade,
    );
  }
}

class InitScreen extends StatelessWidget {
  const InitScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CircleAvatar(
          radius: 90,
          backgroundColor: AppColors.white,
          foregroundColor: AppColors.white,
          backgroundImage: AssetImage('assets/images/breaking-news-.jpg'),
        ),
        SizedBox(height: 40),
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: 'Breaking ',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: AppColors.redAccentS700,
                ),
              ),
              TextSpan(
                text: ' NEWS',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: AppColors.blueS900,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
