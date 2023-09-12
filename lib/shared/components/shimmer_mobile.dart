import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../cubit/cubit.dart';
import '../styles/colors.dart';
import 'components.dart';

class ShimmerMobile extends StatelessWidget {
  const ShimmerMobile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cubit = BreakingNewsAppCubit.get(context);
    return RefreshIndicator(
      onRefresh: () async {
        cubit.getGeneralData();
        cubit.getSportsData();
        cubit.getTechnologyData();
      },
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: ListView.separated(
          itemCount: 4,
          itemBuilder: (context, index) => Shimmer.fromColors(
            baseColor: AppColors.greyS100,
            highlightColor: AppColors.white.withOpacity(.5),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(17.0),
                  child: myContainer(130, 130),
                ),
                const SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    myContainer(150, 15),
                    SizedBox(height: 10),
                    myContainer(165, 20),
                    SizedBox(height: 10),
                    myContainer(165, 20),
                    SizedBox(height: 10),
                    myContainer(100, 15),
                  ],
                ),
              ],
            ),
          ),
          separatorBuilder: (context, index) => SizedBox(),
        ),
      ),
    );
  }
}
