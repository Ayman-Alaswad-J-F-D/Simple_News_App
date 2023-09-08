import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../shared/components/build_desktop.dart';
import '../shared/components/build_mobile.dart';
import '../shared/components/shimmer_desktop.dart';
import '../shared/components/shimmer_mobile.dart';
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
        if (state is NewsAppGetTechnologySuccessState) isLoading = true;
      },
      builder: (context, state) {
        var cubit = BreakingNewsAppCubit.get(context);
        return ScreenTypeLayout(
          breakpoints: ScreenBreakpoints(desktop: 700, tablet: 600, watch: 100),
          mobile: isLoading && cubit.technologyList.isNotEmpty
              ? BuilderMobile(cubit: cubit, list: cubit.technologyList)
              : ShimmerMobile(),
          desktop: isLoading && cubit.technologyList.isNotEmpty
              ? BuilderDesktop(cubit: cubit, list: cubit.technologyList)
              : ShimmerDesktop(),
        );
      },
    );
  }
}
