import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';
import 'package:new_app/modules/splash_screen.dart';
import 'package:new_app/shared/constants.dart';
import 'generated/l10n.dart';
import 'bloc_observer.dart';
import 'logic/cubit/cubit.dart';
import 'logic/cubit/states.dart';
import 'shared/network/local/cache_helper.dart';
import 'shared/network/remote/dio_helper.dart';
import 'shared/themes/themes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DioHelper.init();
  await GetStorage.init();
  final currentLocale = Intl.getCurrentLocale().substring(0, 2);
  bool isDark = CacheHelper.getData(key: 'isDark') ?? false;
  String language = CacheHelper.getData(key: 'language') ?? currentLocale;

  Bloc.observer = MyBlocObserver();
  runApp(BreakingNewsApp(isDark: isDark, language: language));
}

class BreakingNewsApp extends StatelessWidget {
  const BreakingNewsApp({required this.isDark, required this.language});

  final bool isDark;
  final String language;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        return BreakingNewsAppCubit()
          ..getFromCache(languageFromCache: language, modeFromCache: isDark);
      },
      child: BlocConsumer<BreakingNewsAppCubit, BreakingNewsAppStates>(
        listener: (context, state) {
          if (state is ChangeLanguageAppState) {
            BreakingNewsAppCubit.get(context).getLanguage();
          }
        },
        builder: (context, state) {
          final cubit = BreakingNewsAppCubit.get(context);
          return MaterialApp(
            locale: cubit.appLanguage == AR ? Locale(AR) : Locale(EN),
            localizationsDelegates: const [
              S.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: S.delegate.supportedLocales,
            debugShowCheckedModeBanner: false,
            theme: lightTheme,
            darkTheme: darkTheme,
            themeMode: cubit.isDark ? ThemeMode.dark : ThemeMode.light,
            home: const SplashScreen(),
          );
        },
      ),
    );
  }
}
