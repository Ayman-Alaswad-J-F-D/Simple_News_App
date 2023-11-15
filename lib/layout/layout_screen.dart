import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:new_app/generated/l10n.dart';
import 'package:new_app/shared/components/components.dart';
import 'package:new_app/shared/extension/extension_navigation.dart';

import '../logic/cubit/cubit.dart';
import '../logic/cubit/states.dart';
import '../modules/search_screen.dart';
import '../shared/styles/colors.dart';
import '../shared/utils/responsive.dart';
import 'components/all_bottom_nav_bar_items.dart';
import 'components/bottom_nav_bar.dart';
import 'components/icon_search.dart';
import 'components/popup_menu_app.dart';

class LayoutScreen extends StatelessWidget {
  const LayoutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final PageController controller = PageController();
    final cubit = BreakingNewsAppCubit.get(context);

    return BlocConsumer<BreakingNewsAppCubit, BreakingNewsAppStates>(
      listener: (context, state) {
        if (state is LostConnectionState) {
          ScaffoldMessenger.of(context).showSnackBar(
            snackBarMessage(
              Message: S.of(context).ErrorConnection,
              color: AppColors.red,
              duration: 12,
              actionTextButton: SnackBarAction(
                textColor: Theme.of(context).textTheme.caption?.color,
                label: S.of(context).Refresh,
                onPressed: () => cubit.fetchAllData(),
              ),
            ),
          );
        } else if (state is GetGeneralErrorState) {
          ScaffoldMessenger.of(context).showSnackBar(
            snackBarMessage(Message: S.of(context).SomethingIsWrong),
          );
        } else if (state is GetGeneralSuccessState) {
          ScaffoldMessenger.of(context).showSnackBar(
            snackBarMessage(
              Message: S.of(context).Done,
              color: AppColors.primaryColor,
            ),
          );
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            elevation: 0,
            title: Text(S.of(context).TitleApp),
            leading: Icon(Icons.hdr_strong_rounded, size: 30),
            actions: [
              IconSearch(
                icon: Icons.search_rounded,
                onPressed: () => context.toScreen(screen: SearchScreen()),
              ),
              PopupMenuApp(),
            ],
          ),
          body: Row(
            children: [
              if (Responsive.isDesktop(context) || Responsive.isTablet(context))
                Flexible(
                  flex: 0,
                  child: NavigationRail(
                    elevation: 7,
                    destinations: bottomNavItemForDesktop(context),
                    selectedIndex: cubit.currentIndex,
                    onDestinationSelected: (index) =>
                        controller.jumpToPage(index),
                  ),
                ),
              Expanded(
                child: PageView(
                  controller: controller,
                  children: cubit.screens,
                  allowImplicitScrolling: true,
                  onPageChanged: (index) => cubit.changeBottomNavBar(index),
                ),
              ),
            ],
          ),
          bottomNavigationBar:
              !Responsive.isDesktop(context) && !Responsive.isTablet(context)
                  ? BottomNavBar(cubit: cubit, pageControl: controller)
                  : SizedBox(),
        );
      },
    );
  }
}
