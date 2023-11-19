import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_app/shared/utils/responsive.dart';

import '../logic/cubit/cubit.dart';
import '../logic/cubit/states.dart';
import '../shared/components/build_articales.dart';
import '../shared/components/build_desktop.dart';
import '../shared/components/shimmer_desktop.dart';
import '../shared/components/shimmer_mobile.dart';

class GeneralScreen extends StatelessWidget {
  const GeneralScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BreakingNewsAppCubit, BreakingNewsAppStates>(
      listener: (context, state) {
        if (state is GetGeneralSuccessState) {
          BreakingNewsAppCubit.get(context).isLoading = false;
        }
      },
      builder: (context, state) {
        final cubit = BreakingNewsAppCubit.get(context);
        return Responsive(
          mobile: !cubit.isLoading || cubit.generalList.isNotEmpty
              ? ArticlesBuilder(articles: cubit.generalList)
              : ShimmerMobile(),
          desktop: !cubit.isLoading || cubit.generalList.isNotEmpty
              ? DesktopBuilder(atricles: cubit.generalList)
              : ShimmerDesktop(),
        );
      },
    );
  }
}
