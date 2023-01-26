import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:new_app/shared/components/components.dart';
import 'package:new_app/shared/cubit/cubit.dart';
import 'package:new_app/shared/cubit/states.dart';

import '../app_cubit/app_cubit.dart';
import '../modules/search_screen.dart';
import '../shared/components/components.dart';
import '../shared/cubit/cubit.dart';
import '../shared/cubit/states.dart';

class LayoutScreen extends StatefulWidget {
  LayoutScreen({Key? key}) : super(key: key);

  @override
  State<LayoutScreen> createState() => _LayoutScreenState();
}

class _LayoutScreenState extends State<LayoutScreen>
    with SingleTickerProviderStateMixin {
  // late AnimationController _animatedLeading;

  // @override
  // void initState() {
  //   super.initState();
  //   _animatedLeading =
  //       AnimationController(vsync: this, duration: Duration(seconds: 1));
  // }

  // bool moveIconLeading = false;
  // void _iconTapped() {
  //   if (moveIconLeading == false) {
  //     _animatedLeading.forward();
  //     moveIconLeading = true;
  //   } else {
  //     _animatedLeading.reverse();
  //     moveIconLeading = false;
  //   }
  // }

  final PageController controller = PageController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BreakingNewsAppCubit, BreakingNewsAppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = BreakingNewsAppCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            elevation: 0,
            title: const Text('Breaking News'),
            leading: Padding(
              padding: const EdgeInsets.only(top: 0, left: 4),
              child: Icon(Icons.hdr_strong_rounded, size: 30),
            ),
            // leading: Padding(
            //   padding: const EdgeInsets.only(top: 5, left: 8),
            //   child: GestureDetector(
            //     onTap: _iconTapped,
            //     child: AnimatedIcon(
            //       icon: AnimatedIcons.list_view,
            //       progress: _animatedLeading,
            //       size: 40,
            //     ),
            //   ),
            // ),
            actions: [
              IconButton(
                onPressed: () {
                  navigateTo(context, SearchScreen());
                },
                icon: const Icon(Icons.search_rounded),
              ),
              IconButton(
                onPressed: () {
                  AppCubit.get(context).changeDarkMode();
                },
                icon: const Icon(Icons.brightness_4_outlined),
              ),
            ],
          ),
          body: PageView(
            controller: controller,
            allowImplicitScrolling: true,
            onPageChanged: (index) {
              cubit.changeBottomNavBar(index);
            },
            children: cubit.screens,
          ),
          bottomNavigationBar: BottomNavigationBar(
            items: cubit.bottomNavItem,
            currentIndex: cubit.currentIndex,
            onTap: (index) {
              controller.jumpToPage(index);
            },
          ),
        );
      },
    );
  }
}
