import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:new_app/shared/styles/colors.dart';
import 'package:page_transition/page_transition.dart';

import '../layout/layout_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      backgroundColor: AppColors.white,
      splash: const InitScreen(),
      nextScreen: const LayoutScreen(),
      duration: 3000,
      splashIconSize: 330,
      splashTransition: SplashTransition.fadeTransition,
      pageTransitionType: PageTransitionType.leftToRightWithFade,
    );
  }
}

class InitScreen extends StatefulWidget {
  const InitScreen({Key? key}) : super(key: key);

  @override
  State<InitScreen> createState() => _InitScreenState();
}

class _InitScreenState extends State<InitScreen> {
  late final Image splashIcon;
  @override
  void initState() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    splashIcon = Image.asset(
      'assets/images/icon_app.png',
      filterQuality: FilterQuality.low,
    );
    super.initState();
  }

  @override
  void didChangeDependencies() {
    precacheImage(splashIcon.image, context);
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIMode(
      SystemUiMode.manual,
      overlays: SystemUiOverlay.values,
    );
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CircleAvatar(
          radius: 90,
          backgroundColor: AppColors.white,
          foregroundColor: AppColors.white,
          backgroundImage: splashIcon.image,
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
