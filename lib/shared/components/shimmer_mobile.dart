import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import '../../logic/cubit/cubit.dart';
import '../styles/colors.dart';
import 'components.dart';

class ShimmerMobile extends StatelessWidget {
  const ShimmerMobile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cubit = BreakingNewsAppCubit.get(context);
    return RefreshIndicator(
      onRefresh: () async => cubit.fetchAllData(),
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: SingleChildScrollView(
          controller: ScrollController(),
          child: Column(
            children: List<Widget>.generate(
              5,
              (index) => Shimmer.fromColors(
                baseColor: AppColors.greyS100,
                highlightColor: AppColors.white.withOpacity(.5),
                child: Row(
                  children: [
                    Flexible(
                      child: Padding(
                        padding: const EdgeInsets.all(17.0),
                        child: ShimmerContainer(height: 140),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ShimmerContainer(width: 2.1, height: 15),
                          SizedBox(height: 10),
                          ShimmerContainer(width: 2.2, height: 20),
                          SizedBox(height: 10),
                          ShimmerContainer(width: 2.2, height: 20),
                          SizedBox(height: 10),
                          ShimmerContainer(width: 3, height: 15),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
