import 'package:flutter/material.dart';

import '../../logic/cubit/cubit.dart';
import '../../shared/styles/colors.dart';
import 'all_bottom_nav_bar_items.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({
    Key? key,
    required this.cubit,
    required this.pageControl,
  }) : super(key: key);

  final BreakingNewsAppCubit cubit;
  final PageController pageControl;

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
        boxShadow: [
          BoxShadow(
            color: AppColors.black45WithOpacity,
            blurRadius: 4,
            spreadRadius: 2,
          )
        ],
      ),
      child: NavigationBar(
        animationDuration: const Duration(seconds: 1),
        selectedIndex: cubit.currentIndex,
        onDestinationSelected: (index) => pageControl.jumpToPage(index),
        destinations: bottomNavItemForMobile(context),
      ),
    );
  }
}
