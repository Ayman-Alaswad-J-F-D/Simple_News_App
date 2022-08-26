import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hexcolor/hexcolor.dart';

ThemeData darkTheme = ThemeData(
  cardColor: Colors.black45.withOpacity(.1),
  // ignore: deprecated_member_use
  useTextSelectionTheme: true,
  textTheme: TextTheme(
    bodyText1: TextStyle(
      fontSize: 20.0,
      fontWeight: FontWeight.w600,
      color: Colors.indigo.shade200,
      fontFamily: 'Tajawal',
    ),
    bodyText2: TextStyle(
      color: Colors.indigo.shade300,
    ),
  ),
  scaffoldBackgroundColor: HexColor('#353A4F'),
  dividerColor: Colors.grey.shade200,
  appBarTheme: AppBarTheme(
    titleSpacing: 5,
    iconTheme: const IconThemeData(
      color: Colors.white,
    ),
    backgroundColor: HexColor('#353A4F'),
    elevation: 2.0,
    // ignore: deprecated_member_use
    backwardsCompatibility: false,
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: HexColor('#353A4F'),
      statusBarIconBrightness: Brightness.light,
    ),
    titleTextStyle: const TextStyle(
      fontFamily: 'Tajawal',
      color: Colors.white,
      fontSize: 20,
      fontWeight: FontWeight.bold,
    ),
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    type: BottomNavigationBarType.fixed,
    elevation: 5.0,
    backgroundColor: HexColor('#808B96'),
    unselectedItemColor: Colors.grey.shade50,
    selectedLabelStyle:
        const TextStyle(fontFamily: 'Tajawal', letterSpacing: 1.5),
    unselectedLabelStyle:
        const TextStyle(fontFamily: 'Tajawal', letterSpacing: 0.0),
    selectedItemColor: Colors.indigo.shade700,
    enableFeedback: true,
  ),
);

///////////////////

ThemeData lightTheme = ThemeData(
  cardColor: Colors.grey.shade200,
  textTheme: TextTheme(
    bodyText1: TextStyle(
      fontSize: 20.0,
      fontWeight: FontWeight.w600,
      color: Colors.black,
      fontFamily: 'Tajawal',
    ),
    bodyText2: TextStyle(
      color: Colors.grey.shade400,
    ),
  ),
  primarySwatch: Colors.indigo,
  scaffoldBackgroundColor: Colors.white,
  appBarTheme: AppBarTheme(
    titleSpacing: 5.0,
    iconTheme: const IconThemeData(
      color: Colors.indigo,
    ),
    backgroundColor: Colors.white,
    elevation: 2.0,
    // ignore: deprecated_member_use
    backwardsCompatibility: false,
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarBrightness: Brightness.light,
      statusBarColor: Colors.white,
      statusBarIconBrightness: Brightness.dark,
    ),
    titleTextStyle: const TextStyle(
      fontFamily: 'Tajawal',
      color: Colors.indigo,
      fontSize: 20,
      fontWeight: FontWeight.bold,
    ),
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    selectedLabelStyle:
        const TextStyle(fontFamily: 'Tajawal', letterSpacing: 1.5),
    unselectedLabelStyle:
        const TextStyle(fontFamily: 'Tajawal', letterSpacing: 0.0),
    type: BottomNavigationBarType.fixed,
    elevation: 5.0,
    backgroundColor: Colors.white,
    unselectedIconTheme: IconThemeData(color: Colors.grey.shade500),
  ),
);
