import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../shared/components/components.dart';
import '../shared/cubit/cubit.dart';
import '../shared/cubit/states.dart';

// ignore: must_be_immutable
class SportsScreen extends StatelessWidget {
  SportsScreen({Key? key}) : super(key: key);
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    var cubit = NewAppCubit.get(context);

    return BlocConsumer<NewAppCubit, NewAppStates>(
      listener: (context, state) {
        if (state is NewAppGetSportsSuccessState) {
          isLoading = true;
        }
      },
      builder: (context, state) {
        return ScreenTypeLayout(
          mobile: isLoading && cubit.sportList.isNotEmpty
              ? Builder(
                  builder: (BuildContext context) {
                    cubit.isDesktop == false
                        ? articlesBuilder(cubit.sportList, context)
                        : cubit.setDesktop(false);
                    return articlesBuilder(cubit.sportList, context);
                  },
                )
              : myShimmerAndroid(context),
          desktop: isLoading && cubit.sportList.isNotEmpty
              ? Builder(
                  builder: (BuildContext context) {
                    cubit.isDesktop
                        ? desktopItem(cubit.sportList, context)
                        : cubit.setDesktop(true);
                    return desktopItem(cubit.sportList, context);
                  },
                )
              : myShimmerDesktop(cubit.sportList, context),
          breakpoints: ScreenBreakpoints(desktop: 700, tablet: 600, watch: 100),
        );
      },
    );
  }
}
