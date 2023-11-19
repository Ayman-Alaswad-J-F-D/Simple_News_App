import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../logic/cubit/cubit.dart';
import '../logic/cubit/states.dart';
import '../shared/components/build_desktop.dart';
import '../shared/components/build_articales.dart';
import '../shared/components/shimmer_desktop.dart';
import '../shared/components/shimmer_mobile.dart';
import '../shared/utils/responsive.dart';

class SportsScreen extends StatelessWidget {
  const SportsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BreakingNewsAppCubit, BreakingNewsAppStates>(
      listener: (context, state) {
        if (state is GetSportsSuccessState)
          BreakingNewsAppCubit.get(context).isLoading = false;
      },
      builder: (context, state) {
        final cubit = BreakingNewsAppCubit.get(context);
        return Responsive(
          mobile: !cubit.isLoading || cubit.sportList.isNotEmpty
              ? ArticlesBuilder(articles: cubit.sportList)
              : ShimmerMobile(),
          desktop: !cubit.isLoading || cubit.sportList.isNotEmpty
              ? DesktopBuilder(atricles: cubit.sportList)
              : ShimmerDesktop(),
        );
      },
    );
  }
}
