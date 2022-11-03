import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_app/shared/components/components.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../shared/cubit/cubit.dart';
import '../shared/cubit/states.dart';

// ignore: must_be_immutable
class GeneralScreen extends StatelessWidget {
  GeneralScreen({Key? key}) : super(key: key);
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    var cubit = NewAppCubit.get(context);

    return BlocConsumer<NewAppCubit, NewAppStates>(
      listener: (context, state) {
        if (state is NewAppGetGeneralSuccessState ) {
          isLoading = true;
        }
      },
      builder: (context, state) {
        return ScreenTypeLayout(
          mobile: isLoading && cubit.generalList.isNotEmpty
              ? Builder(
                  builder: (BuildContext context) {
                    cubit.isDesktop == false
                        ? articlesBuilder(cubit.generalList, context)
                        : cubit.setDesktop(false);
                    return articlesBuilder(cubit.generalList, context);
                  },
                )
              : myShimmerAndroid(context),
          desktop: isLoading && cubit.generalList.isNotEmpty
              ? Builder(
                  builder: (BuildContext context) {
                    cubit.isDesktop
                        ? desktopItem(cubit.generalList, context)
                        : cubit.setDesktop(true);
                    return desktopItem(cubit.generalList, context);
                  },
                )
              : myShimmerDesktop(cubit.generalList, context),
          breakpoints: ScreenBreakpoints(desktop: 700, tablet: 600, watch: 100),
        );
      },
    );
  }
}
