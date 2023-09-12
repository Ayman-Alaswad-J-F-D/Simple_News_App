import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../shared/components/build_desktop.dart';
import '../shared/components/build_mobile.dart';
import '../shared/components/shimmer_desktop.dart';
import '../shared/components/shimmer_mobile.dart';
import '../shared/cubit/cubit.dart';
import '../shared/cubit/states.dart';

class TechnologyScreen extends StatelessWidget {
  const TechnologyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var cubit = BreakingNewsAppCubit.get(context);
    return BlocConsumer<BreakingNewsAppCubit, BreakingNewsAppStates>(
      listener: (context, state) {
        if (state is GetTechnologySuccessState) cubit.isLoading = true;
      },
      builder: (context, state) {
        return ScreenTypeLayout(
          breakpoints: ScreenBreakpoints(desktop: 700, tablet: 600, watch: 100),
          mobile: cubit.isLoading && cubit.technologyList.isNotEmpty
              ? BuilderMobile(cubit: cubit, list: cubit.technologyList)
              : ShimmerMobile(),
          desktop: cubit.isLoading && cubit.technologyList.isNotEmpty
              ? BuilderDesktop(cubit: cubit, list: cubit.technologyList)
              : ShimmerDesktop(),
        );
      },
    );
  }
}
