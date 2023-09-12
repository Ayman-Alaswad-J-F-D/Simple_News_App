import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_storage/get_storage.dart';

import 'app_cubit/app_cubit.dart';
import 'app_cubit/app_states.dart';
import 'modules/splash_screen.dart';
import 'shared/bloc_observer.dart';
import 'shared/cubit/cubit.dart';
import 'shared/network/local/cache_helper.dart';
import 'shared/network/remote/dio_helper.dart';
import 'shared/themes/themes.dart';

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // set minmum width and height on app
  // if (Platform.isWindows) {
  //   await DesktopWindow.setMinWindowSize(Size(500, 700));
  // }
  // final url = "https://www.google.com";
  // Webview(true)
  //     .setTitle("title")
  //     .setSize(1280, 800, SizeHint.none)
  //     .navigate(url)
  //     .run();

  await GetStorage.init();
  bool? isDark = CacheHelper.getData(key: 'isDark') ?? false;
  BlocOverrides.runZoned(
    () {
      // Use cubits...
      DioHelper.init();
      HttpOverrides.global = MyHttpOverrides();
      runApp(BreakingNewsApp(isDark));
    },
    blocObserver: MyBlocObserver(),
  );
}

class BreakingNewsApp extends StatelessWidget {
  const BreakingNewsApp(this.isDark);

  final bool? isDark;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AppCubit()..changeDarkMode(fromShared: isDark),
        ),
        BlocProvider(
          create: (context) => BreakingNewsAppCubit()
            ..getGeneralData()
            ..getSportsData()
            ..getTechnologyData(),
        ),
      ],
      child: BlocBuilder<AppCubit, AppStates>(
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: lightTheme,
            darkTheme: darkTheme,
            themeMode:
                AppCubit.get(context).isDark ? ThemeMode.dark : ThemeMode.light,
            home: const SplashScreen(),
          );
        },
      ),
    );
  }
}
