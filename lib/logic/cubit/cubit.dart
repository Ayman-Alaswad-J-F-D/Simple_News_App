import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:new_app/logic/models/news_model.dart';

import '../../modules/general_screen.dart';
import '../../modules/sports_screen.dart';
import '../../modules/technology_screen.dart';

import '../../shared/constants.dart';
import '../../shared/network/local/cache_helper.dart';
import '../../shared/network/remote/dio_helper.dart';
import 'states.dart';

class BreakingNewsAppCubit extends Cubit<BreakingNewsAppStates> {
  BreakingNewsAppCubit() : super(NewAppInitialState());

  static BreakingNewsAppCubit get(context) => BlocProvider.of(context);

  int screenIndex = 0;
  bool isLoading = false;

  void changeBottomNavBar(int index) {
    screenIndex = index;
    emit(ChangeBottomNavState());
  }

  List<Widget> screens = const [
    GeneralScreen(),
    SportsScreen(),
    TechnologyScreen(),
  ];

  List<ArticlesModel> generalList = [];
  List<ArticlesModel> sportList = [];
  List<ArticlesModel> technologyList = [];
  List<ArticlesModel> searchList = [];

  int selectedItem = 0;
  void selectItemBuilder(index) {
    selectedItem = index;
    emit(SelectPageItemState());
  }

  bool isDark = false;
  // bool isArabic = false;
  String appMode = 'Dark Mode';
  String appLanguage = EN;
  final List<String> languageOptions = [EN, AR];

  //* Initial Function When Run App (Fetching data depend on language stored and get theme mode from cache)
  getFromCache({
    required String languageFromCache,
    required bool modeFromCache,
  }) {
    log(
      'language: ${languageFromCache} isDark: $modeFromCache',
      name: 'Initial Function',
    );
    changeThemeMode(mode: modeFromCache);
    getLanguage(language: languageFromCache);
  }

  //* Function For Fetch All Data After Check Interner Connection
  fetchAllData({String? country}) async {
    if (await InternetConnectionChecker().hasConnection) {
      getGeneralData(country: country);
      getSportsData(country: country);
      getTechnologyData(country: country);
    } else {
      emit(LostConnectionState());
    }
  }

  //* Function For Get Language From Cache or Fetch Data When Change Language in App
  getLanguage({String? language}) {
    isLoading = true;
    generalList.clear();
    sportList.clear();
    technologyList.clear();
    // emit(LoadingState());
    if (language != null) {
      appLanguage = language;
      //? If Get Language From Cache
      fetchAllData(country: language == AR ? EG_COUNTRY : US_COUNTRY);
    } else {
      //? If Change Language in App
      fetchAllData(country: appLanguage == AR ? EG_COUNTRY : US_COUNTRY);
    }
  }

  //* Function For Change Language and a Widget Direction RTL or LTR in App
  void changeLanguage({String? language}) {
    if (language != null) {
      appLanguage = language;
    }
    final langFromCache = CacheHelper.getData(key: 'language');
    if (appLanguage != langFromCache) {
      CacheHelper.saveData(key: 'language', value: appLanguage).then(
        (value) => emit(ChangeLanguageAppState()),
      );
    }
  }

  //* Function For Change Theme Mode To Dark or Light in App
  void changeThemeMode({bool? mode}) {
    log('Dark Mode From Cache is $mode', name: 'Change Theme Mode Method');
    if (mode != null) {
      isDark = mode;
    } else {
      appMode = 'Light Mode';
      isDark = !isDark;
      CacheHelper.saveData(key: 'isDark', value: isDark).then(
        (value) => emit(ChangeModeAppState()),
      );
    }
  }

  //* Fetch General Data From API
  void getGeneralData({String? country}) async {
    emit(GetGeneralLodingState());
    await DioHelper.getData(
      url: 'v2/top-headlines',
      query: {
        'country': country ?? US_COUNTRY,
        'category': GENERAL,
        'apiKey': API_KEY,
      },
    )
        .then(
          (value) {
            final data = NewsListModel.fromJson(value.data);
            generalList = data.articles.where((article) {
              final years = DateTime.parse(article.publishedAt.toString());
              return years.year == DateTime.now().year;
            }).toList();
          },
        )
        .then((_) => emit(GetGeneralSuccessState()))
        .catchError(
          (error) {
            print(error.toString());
            emit(GetGeneralErrorState(error.toString()));
          },
        );
  }

  //* Fetch Sports Data From API
  void getSportsData({String? country}) async {
    emit(GetSportsLodingState());
    await DioHelper.getData(
      url: 'v2/top-headlines',
      query: {
        'country': country ?? US_COUNTRY,
        'category': SPORTS,
        'apiKey': API_KEY,
      },
    )
        .then(
          (value) {
            final data = NewsListModel.fromJson(value.data);
            sportList = data.articles.where((article) {
              final years = DateTime.parse(article.publishedAt.toString());
              return years.year == DateTime.now().year;
            }).toList();
          },
        )
        .then((_) => emit(GetSportsSuccessState()))
        .catchError(
          (error) {
            print(error.toString());
            emit(GetSportsErrorState(error.toString()));
          },
        );
  }

  //* Fetch Technology Data From API
  void getTechnologyData({String? country}) async {
    emit(GetTechnologyLodingState());
    await DioHelper.getData(
      url: 'v2/top-headlines',
      query: {
        'country': country ?? US_COUNTRY,
        'category': TECHNOLOGY,
        'apiKey': API_KEY,
      },
    )
        .then(
          (value) {
            final data = NewsListModel.fromJson(value.data);
            technologyList = data.articles.where((article) {
              final years = DateTime.parse(article.publishedAt.toString());
              return years.year == DateTime.now().year;
            }).toList();
          },
        )
        .then((_) => emit(GetTechnologySuccessState()))
        .catchError(
          (error) {
            print(error.toString());
            emit(GetTechnologyErrorState(error.toString()));
          },
        );
  }

  //* Fetch Data For Search From API // This function is not used
  // void getSearch(searchValue) async {
  //   await DioHelper.getData(
  //     url: 'v2/everything',
  //     query: {
  //       'q': '$searchValue',
  //       'apiKey': API_KEY,
  //     },
  //   )
  //       .then(
  //         (value) {
  //           final data = NewsListModel.fromJson(value.data);
  //           searchList.addAll(data.articles);
  //         },
  //       )
  //       .then((_) => emit(GetSearchSuccessState()))
  //       .catchError(
  //         (error) {
  //           print(error.toString());
  //           emit(GetSearchErrorState(error.toString()));
  //         },
  //       );
  // }

  //* Search on artecle in all lists
  void searchFromLists({String? value}) {
    searchList.clear();
    if (value!.isEmpty) {
      searchList.addAll(generalList);
    }
    updateSearch(value: value);
    emit(OnSearchState());
  }

  void updateSearch({required String value}) {
    searchList.addAll(
      generalList
          .where((element) =>
              element.title!.toLowerCase().contains(value.toLowerCase()))
          .toList(),
    );
    searchList.addAll(
      sportList
          .where((element) =>
              element.title!.toLowerCase().contains(value.toLowerCase()))
          .toList(),
    );
    searchList.addAll(
      technologyList
          .where((element) =>
              element.title!.toLowerCase().contains(value.toLowerCase()))
          .toList(),
    );
  }
}
