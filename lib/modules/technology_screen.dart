import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../shared/components/components.dart';
import '../shared/cubit/cubit.dart';
import '../shared/cubit/states.dart';

// ignore: must_be_immutable
class TechnologyScreen extends StatelessWidget {
  TechnologyScreen({Key? key}) : super(key: key);
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BreakingNewsAppCubit, BreakingNewsAppStates>(
      listener: (context, state) {
        if (state is NewsAppGetTechnologySuccessState) {
          isLoading = true;
        }
      },
      builder: (context, state) {
        var cubit = BreakingNewsAppCubit.get(context);

        return ScreenTypeLayout(
          mobile: isLoading && cubit.technologyList.isNotEmpty
              ? Builder(
                  builder: (BuildContext context) {
                    cubit.isDesktop == false
                        ? articlesBuilder(cubit.technologyList, context)
                        : cubit.setDesktop(false);
                    return articlesBuilder(cubit.technologyList, context);
                  },
                )
              : myShimmerAndroid(context),
          desktop: isLoading && cubit.technologyList.isNotEmpty
              ? Builder(
                  builder: (BuildContext context) {
                    cubit.isDesktop
                        ? desktopItem(cubit.technologyList, context)
                        : cubit.setDesktop(true);
                    return desktopItem(cubit.technologyList, context);
                  },
                )
              : myShimmerDesktop(cubit.technologyList, context),
          breakpoints: ScreenBreakpoints(desktop: 700, tablet: 600, watch: 100),
        );
      },
    );
  }
}
