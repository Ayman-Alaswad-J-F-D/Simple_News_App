// import 'package:bloc/bloc.dart';
// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../modules/general_screen.dart';
import '../../modules/sports_screen.dart';
import '../../modules/technology_screen.dart';
import '../components/constants.dart';
import '../network/remote/dio_helper.dart';
import 'states.dart';

class BreakingNewsAppCubit extends Cubit<BreakingNewsAppStates> {
  BreakingNewsAppCubit() : super(NewAppInitialState());

  // to be more esily when use this cubit
  static BreakingNewsAppCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;

  List<BottomNavigationBarItem> bottomNavItem = const [
    BottomNavigationBarItem(
      icon: Icon(Icons.newspaper_rounded),
      label: 'General',
    ),
    BottomNavigationBarItem(
      icon: Icon(
        Icons.sports_football_rounded,
      ),
      label: 'Sports',
    ),
    BottomNavigationBarItem(
      icon: Icon(
        Icons.psychology_rounded,
      ),
      label: 'Technology',
    ),
  ];

  ////////////

  void changeBottomNavBar(int index) {
    currentIndex = index;
    if (index == 2) getTechnologyData();
    emit(NewsAppBottomNavState());
  }

  List<Widget> screens = [
    GeneralScreen(),
    SportsScreen(),
    TechnologyScreen(),
  ];

  List<dynamic> generalList = [];
  List<dynamic> sportList = [];
  List<dynamic> technologyList = [];
  bool isDesktop = false;

  void setDesktop(bool value) {
    isDesktop = value;
    emit(NewsAppSetDesktopState());
  }

  int selectedItem = 0;
  void selectItemBuilder(index) {
    selectedItem = index;
    emit(NewsAppSelectPage1ItemState());
  }

  void getGeneralData() async {
    emit(NewsAppGetGeneralLodingState());
    await DioHelper.getData(
      url: 'v2/top-headlines',
      query: {
        'country': 'us',
        'category': 'general',
        'apiKey': myApiKey,
      },
    ).then(
      (value) {
        generalList = value.data["articles"];
        print(value.data["articles"][0]["title"]);
        // print(page1[0]['title']);
        emit(NewsAppGetGeneralSuccessState());
      },
    ).catchError(
      (error) {
        print(error.toString());
        emit(NewsAppGetGeneralErrorState(error.toString()));
      },
    );
  }

  void getSportsData() async {
    emit(NewsAppGetSportsLodingState());
    if (sportList.isEmpty) {
      await DioHelper.getData(
        url: 'v2/top-headlines',
        query: {
          'country': 'us',
          'category': 'sports',
          'apiKey': myApiKey,
        },
      ).then(
        (value) {
          sportList = value.data["articles"];

          print(value.data["articles"][0]["title"]);
          // print(page1[0]['title']);
          emit(NewsAppGetSportsSuccessState());
        },
      ).catchError(
        (error) {
          print(error.toString());
          emit(NewsAppGetSportsErrorState(error.toString()));
        },
      );
    } else {
      emit(NewsAppGetSportsSuccessState());
    }
  }

  void getTechnologyData() async {
    emit(NewsAppGetTechnologyLodingState());
    if (technologyList.isEmpty) {
      await DioHelper.getData(
        url: 'v2/top-headlines',
        query: {
          'country': 'us',
          'category': 'technology',
          'apiKey': myApiKey,
        },
      ).then(
        (value) {
          technologyList = value.data["articles"];

          print(value.data["articles"][0]["title"]);
          // print(page1[0]['title']);
          emit(NewsAppGetTechnologySuccessState());
        },
      ).catchError(
        (error) {
          print(error.toString());
          emit(NewsAppGetTechnologyErrorState(error.toString()));
        },
      );
    } else {
      emit(NewsAppGetTechnologySuccessState());
    }
  }

  List<dynamic> search = [];

  void getSearch(myValue) {
    emit(NewsAppGetSearchLodingState());
    DioHelper.getData(
      url: 'v2/everything',
      query: {
        'q': '$myValue',
        'apiKey': myApiKey,
      },
    ).then(
      (value) {
        search = value.data["articles"];
        // print(value.data["articles"][0]["title"]);
        // print(page1[0]['title']);
        emit(NewsAppGetSearchSuccessState());
      },
    ).catchError(
      (error) {
        print(error.toString());
        emit(NewsAppGetSearchErrorState(error.toString()));
      },
    );
  }
}
