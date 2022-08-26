// import 'package:bloc/bloc.dart';
// ignore_for_file: avoid_print

import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_app/modules/page1.dart';
import 'package:new_app/modules/page2.dart';
import 'package:new_app/modules/page3.dart';
import 'package:new_app/shared/cubit/states.dart';

import '../network/remote/dio_helper.dart';

class NewAppCubit extends Cubit<NewAppStates> {
  NewAppCubit() : super(NewAppInitialState());

  // to be more esily when use this cubit
  static NewAppCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;

  List<TabItem> bottomNavItem = [
    const TabItem(
      icon: Icon(Icons.newspaper_rounded),
      title: 'General',
    ),
    const TabItem(
      icon: Icon(
        Icons.sports_football_rounded,
      ),
      title: 'Sports',
    ),
    const TabItem(
      icon: Icon(
        Icons.psychology_rounded,
      ),
      title: 'Technology',
    ),
  ];

  ////////////

  void changeBottomNavBar(int index) {
    currentIndex = index;
    if (index == 1) return getPage2();
    if (index == 2) return getPage3();
    emit(NewAppBottomNavState());
  }

  List<Widget> screens = [
    Page1Screen(),
    Page2Screen(),
    Page3Screen(),
  ];

  List<dynamic> page1 = [];
  List<dynamic> page2 = [];
  List<dynamic> page3 = [];
  bool isDesktop = false;

  void setDesktop(bool value) {
    isDesktop = value;
    emit(NewAppSetDesktopState());
  }

  int page1SelectedItem = 0;
  void selectItemPage1Item(index) {
    page1SelectedItem = index;
    emit(NewAppSelectPage1ItemState());
  }

  void getPage1() async {
    emit(NewAppGetPage1LodingState());
    await DioHelper.getData(
      url: 'v2/top-headlines',
      query: {
        'country': 'us',
        'category': 'general',
        'apiKey': '14229368f6b44500b817708b722a1285',
      },
    ).then(
      (value) {
        page1 = value.data["articles"];
        print(value.data["articles"][0]["title"]);
        // print(page1[0]['title']);
        emit(NewAppGetPage1SuccessState());
      },
    ).catchError(
      (error) {
        print(error.toString());
        emit(NewAppGetPage1ErrorState(error.toString()));
      },
    );
  }

  void getPage2() async {
    emit(NewAppGetPage2LodingState());
    if (page2.isEmpty) {
      await DioHelper.getData(
        url: 'v2/top-headlines',
        query: {
          'country': 'us',
          'category': 'sports',
          'apiKey': '14229368f6b44500b817708b722a1285',
        },
      ).then(
        (value) {
          page2 = value.data["articles"];

          print(value.data["articles"][0]["title"]);
          // print(page1[0]['title']);
          emit(NewAppGetPage2SuccessState());
        },
      ).catchError(
        (error) {
          print(error.toString());
          emit(NewAppGetPage2ErrorState(error.toString()));
        },
      );
    } else {
      emit(NewAppGetPage2SuccessState());
    }
  }

  void getPage3() async {
    emit(NewAppGetPage3LodingState());
    if (page3.isEmpty) {
      await DioHelper.getData(
        url: 'v2/top-headlines',
        query: {
          'country': 'us',
          'category': 'technology',
          'apiKey': '14229368f6b44500b817708b722a1285',
        },
      ).then(
        (value) {
          page3 = value.data["articles"];

          print(value.data["articles"][0]["title"]);
          // print(page1[0]['title']);
          emit(NewAppGetPage3SuccessState());
        },
      ).catchError(
        (error) {
          print(error.toString());
          emit(NewAppGetPage3ErrorState(error.toString()));
        },
      );
    } else {
      emit(NewAppGetPage3SuccessState());
    }
  }

  List<dynamic> search = [];

  void getSearch(myValue) {
    emit(NewAppGetSearchLodingState());
    DioHelper.getData(
      url: 'v2/everything',
      query: {
        'q': '$myValue',
        'apiKey': '14229368f6b44500b817708b722a1285',
      },
    ).then(
      (value) {
        search = value.data["articles"];
        // print(value.data["articles"][0]["title"]);
        // print(page1[0]['title']);
        emit(NewAppGetSearchSuccessState());
      },
    ).catchError(
      (error) {
        print(error.toString());
        emit(NewAppGetSearchErrorState(error.toString()));
      },
    );
  }
}
