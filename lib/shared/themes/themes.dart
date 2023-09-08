// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../styles/colors.dart';
import '../styles/styles.dart';

ThemeData darkTheme = ThemeData(
  scaffoldBackgroundColor: AppColors.darkColor,
  cardColor: AppColors.black45WithOpacity,
  useTextSelectionTheme: true,
  textTheme: TextTheme(
    bodyText1: TextStyle(
      fontSize: 20.0,
      fontWeight: FontWeight.w600,
      fontFamily: AppFonts.primaty,
      color: AppColors.primaryColorS200,
    ),
    bodyText2: TextStyle(color: AppColors.primaryColorS300),
  ),
  dividerColor: AppColors.greyS100,
  appBarTheme: AppBarTheme(
    elevation: 2.0,
    titleSpacing: 5,
    backgroundColor: AppColors.darkColor,
    iconTheme: const IconThemeData(color: AppColors.white),
    backwardsCompatibility: false,
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: AppColors.darkColor,
      statusBarIconBrightness: Brightness.light,
    ),
    titleTextStyle: const TextStyle(
      fontSize: 20,
      color: AppColors.white,
      fontFamily: AppFonts.primaty,
      fontWeight: FontWeight.bold,
    ),
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    elevation: 5.0,
    enableFeedback: true,
    type: BottomNavigationBarType.fixed,
    unselectedItemColor: AppColors.greyS50,
    backgroundColor: AppColors.darkLightColor,
    selectedLabelStyle:
        const TextStyle(fontFamily: 'Tajawal', letterSpacing: 1.5),
    unselectedLabelStyle:
        const TextStyle(fontFamily: 'Tajawal', letterSpacing: 0.0),
    selectedItemColor: AppColors.primaryColorS700,
  ),
);

///////////////////

ThemeData lightTheme = ThemeData(
  cardColor: AppColors.greyS200,
  textTheme: TextTheme(
    bodyText1: TextStyle(
      fontSize: 20.0,
      color: AppColors.black,
      fontWeight: FontWeight.w600,
      fontFamily: AppFonts.primaty,
    ),
    bodyText2: TextStyle(color: AppColors.greyS400),
  ),
  primarySwatch: AppColors.primaryColor,
  scaffoldBackgroundColor: AppColors.white,
  appBarTheme: AppBarTheme(
    elevation: 2.0,
    titleSpacing: 5.0,
    backgroundColor: Colors.white,
    iconTheme: const IconThemeData(color: AppColors.primaryColor),
    backwardsCompatibility: false,
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: AppColors.white,
      statusBarBrightness: Brightness.light,
      statusBarIconBrightness: Brightness.dark,
    ),
    titleTextStyle: const TextStyle(
      fontSize: 20,
      color: AppColors.primaryColor,
      fontFamily: AppFonts.primaty,
      fontWeight: FontWeight.bold,
    ),
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    elevation: 5.0,
    backgroundColor: AppColors.white,
    unselectedIconTheme: IconThemeData(color: AppColors.greyS500),
    selectedLabelStyle:
        const TextStyle(fontFamily: AppFonts.primaty, letterSpacing: 1.5),
    unselectedLabelStyle:
        const TextStyle(fontFamily: AppFonts.primaty, letterSpacing: 0.0),
    type: BottomNavigationBarType.fixed,
  ),
);
