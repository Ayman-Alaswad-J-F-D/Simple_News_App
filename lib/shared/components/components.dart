import 'package:flutter/material.dart';
import '../styles/colors.dart';

Widget myContainer(double? width, double? height) => Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: AppColors.white,
      ),
    );

/////////////////////////////

Widget myDivider() => const Padding(
      padding: EdgeInsets.only(left: 20.0),
      child: Divider(),
    );

void navigateTo(context, widget) => Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => widget),
    );

void navigateAndFinish(context, widget) => Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => widget),
      (route) => false,
    );
