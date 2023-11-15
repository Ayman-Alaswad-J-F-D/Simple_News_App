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
    caption: TextStyle(
      fontSize: 16.0,
      fontFamily: AppFonts.primaty,
      fontWeight: FontWeight.w600,
      color: AppColors.white,
    ),
    bodyText1: TextStyle(
      fontSize: 18.0,
      fontWeight: FontWeight.w600,
      fontFamily: AppFonts.primaty,
      color: AppColors.primaryColorS200,
    ),
    bodyText2: TextStyle(color: AppColors.darkLightColor),
  ),
  dividerColor: AppColors.white24,

  radioTheme:
      RadioThemeData(fillColor: MaterialStateProperty.all(AppColors.white)),

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
  iconTheme: IconThemeData(color: AppColors.white),
  popupMenuTheme: PopupMenuThemeData(color: AppColors.primaryDark),

  //* Navigation Rail ThemeData For Desktop
  navigationRailTheme: NavigationRailThemeData(
    useIndicator: true,
    indicatorColor: AppColors.white,
    backgroundColor: AppColors.primaryDark,
    selectedIconTheme: IconThemeData(color: AppColors.primaryColor),
    unselectedIconTheme: IconThemeData(color: AppColors.white),
  ),
  //* Navigation Bar ThemeData For All Device
  navigationBarTheme: NavigationBarThemeData(
    backgroundColor: AppColors.primaryDark,
    indicatorColor: AppColors.darkColor,
    iconTheme: MaterialStateProperty.all(IconThemeData(color: AppColors.white)),
    labelTextStyle: MaterialStateProperty.all(
      TextStyle(
        letterSpacing: 1.5,
        color: AppColors.white,
        fontFamily: AppFonts.primaty,
      ),
    ),
  ),

  inputDecorationTheme: InputDecorationTheme(
    floatingLabelStyle: TextStyle(color: AppColors.primaryColorS200),
    prefixIconColor: AppColors.primaryColorS200,
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(15),
      borderSide: BorderSide(color: AppColors.primaryColorS200),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: AppColors.primaryColorS200),
    ),
  ),

  // bottomNavigationBarTheme: BottomNavigationBarThemeData(
  //   elevation: 5.0,
  //   enableFeedback: true,
  //   type: BottomNavigationBarType.fixed,
  //   unselectedItemColor: AppColors.greyS50,
  //   backgroundColor: AppColors.darkLightColor,
  //   selectedLabelStyle:
  //       const TextStyle(fontFamily: 'Tajawal', letterSpacing: 1.5),
  //   unselectedLabelStyle:
  //       const TextStyle(fontFamily: 'Tajawal', letterSpacing: 0.0),
  //   selectedItemColor: AppColors.primaryColorS700,
  // ),
);

///////////////////

ThemeData lightTheme = ThemeData(
  scaffoldBackgroundColor: AppColors.white,
  cardColor: AppColors.greyS200,
  textTheme: TextTheme(
    caption: TextStyle(
      fontSize: 16.0,
      fontFamily: AppFonts.primaty,
      fontWeight: FontWeight.w600,
      color: AppColors.primaryColor,
    ),
    bodyText1: TextStyle(
      fontSize: 18.0,
      color: AppColors.black,
      fontWeight: FontWeight.w600,
      fontFamily: AppFonts.primaty,
    ),
    bodyText2: TextStyle(color: AppColors.greyS400),
  ),
  primarySwatch: AppColors.primaryColor,
  dividerColor: AppColors.greyS400,
  radioTheme: RadioThemeData(
      fillColor: MaterialStateProperty.all(AppColors.primaryColor)),

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
  iconTheme: IconThemeData(color: AppColors.primaryColor),
  popupMenuTheme: PopupMenuThemeData(color: AppColors.white),

  //* Navigation Rail ThemeData For Desktop
  navigationRailTheme: NavigationRailThemeData(
    backgroundColor: AppColors.primaryColor,
    useIndicator: true,
    indicatorColor: AppColors.greyS100,
    selectedIconTheme: IconThemeData(color: AppColors.primaryColor),
    unselectedIconTheme: IconThemeData(color: AppColors.white),
  ),
  //* Navigation Bar ThemeData For All Device
  navigationBarTheme: NavigationBarThemeData(
    backgroundColor: AppColors.white,
    indicatorColor: AppColors.greyS300,
    iconTheme:
        MaterialStateProperty.all(IconThemeData(color: AppColors.primaryColor)),
    labelTextStyle: MaterialStateProperty.all(
      TextStyle(
        letterSpacing: 1.5,
        fontFamily: AppFonts.primaty,
        color: AppColors.primaryColor,
      ),
    ),
  ),

  inputDecorationTheme: InputDecorationTheme(
    floatingLabelStyle: TextStyle(color: AppColors.primaryColor),
    counterStyle: TextStyle(color: AppColors.primaryColor),
    hintStyle: TextStyle(color: AppColors.primaryColor),
    prefixStyle: TextStyle(color: AppColors.primaryColor),
    prefixIconColor: AppColors.primaryColor,
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(15),
      borderSide: BorderSide(color: AppColors.darkLightColor),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: AppColors.primaryColor),
    ),
  ),

  // bottomNavigationBarTheme: BottomNavigationBarThemeData(
  //   elevation: 5.0,
  //   backgroundColor: AppColors.white,
  //   unselectedIconTheme: IconThemeData(color: AppColors.greyS500),
  //   selectedLabelStyle:
  //       const TextStyle(fontFamily: AppFonts.primaty, letterSpacing: 1.5),
  //   unselectedLabelStyle:
  //       const TextStyle(fontFamily: AppFonts.primaty, letterSpacing: 0.0),
  //   type: BottomNavigationBarType.fixed,
  // ),
);
