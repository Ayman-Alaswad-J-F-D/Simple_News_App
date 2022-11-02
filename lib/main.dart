import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_app/app_cubit/app_cubit.dart';
import 'package:new_app/app_cubit/app_states.dart';
import 'package:new_app/layout/new_app.dart';
import 'package:new_app/shared/bloc_observer.dart';
import 'package:new_app/shared/cubit/cubit.dart';
import 'package:new_app/shared/network/local/cache_helper.dart';
import 'package:new_app/shared/network/remote/dio_helper.dart';
import 'package:new_app/shared/themes/themes.dart';
import 'package:page_transition/page_transition.dart';

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

  await CacheHelper.init();
  bool? isDark = CacheHelper.getData(key: 'isDark');
  BlocOverrides.runZoned(
    () {
      // Use cubits...

      DioHelper.init();

      runApp(MyApp(isDark));
    },
    blocObserver: MyBlocObserver(),
  );
}

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      backgroundColor: Colors.white,
      splash: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleAvatar(
            backgroundColor: Colors.white,
            foregroundColor: Colors.white,
            radius: 90,
            backgroundImage: AssetImage(
              'assets/images/breaking-news-.jpg',
            ),
          ),
          SizedBox(height: 20),
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: 'Breaking ',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.redAccent.shade700,
                  ),
                ),
                TextSpan(
                  text: ' NEWS',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue.shade900,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      nextScreen: NewApp(),
      duration: 3000,
      splashIconSize: 330,
      splashTransition: SplashTransition.fadeTransition,
      pageTransitionType: PageTransitionType.leftToRightWithFade,
    );
  }
}

class MyApp extends StatelessWidget {
  final bool? isDark;
  MyApp(this.isDark);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AppCubit()..changeDarkMode(fromShared: isDark),
        ),
        BlocProvider(
          create: (context) => NewAppCubit()
            ..getGeneralData()
            ..getSportsData()
            ..getTechnologyData(),
        ),
      ],
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            darkTheme: darkTheme,
            themeMode:
                AppCubit.get(context).isDark ? ThemeMode.dark : ThemeMode.light,
            theme: lightTheme,
            home: SplashScreen(),
          );
        },
      ),
    );
  }
}
