import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../styles/colors.dart';
import 'components.dart';

class ShimmerDesktop extends StatelessWidget {
  const ShimmerDesktop({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: SingleChildScrollView(
              controller: ScrollController(),
              child: Column(
                children: List<Widget>.generate(
                  3,
                  (index) => Shimmer.fromColors(
                    baseColor: AppColors.greyS100,
                    highlightColor: AppColors.white.withOpacity(.5),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: ShimmerContainer(height: 200, isDesktop: true),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ShimmerContainer(width: 4.5, height: 25),
                              SizedBox(height: 10),
                              ShimmerContainer(width: 4, height: 20),
                              SizedBox(height: 10),
                              ShimmerContainer(width: 4, height: 20),
                              SizedBox(height: 10),
                              ShimmerContainer(width: 5, height: 25),
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
        ),
        Expanded(
          child: Shimmer.fromColors(
            baseColor: AppColors.greyS100,
            highlightColor: AppColors.white,
            child: Padding(
              padding: const EdgeInsets.all(17.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ShimmerContainer(width: 1, height: 380),
                  SizedBox(height: 40),
                  ShimmerContainer(width: 3, height: 40),
                  SizedBox(height: 10),
                  ShimmerContainer(width: 2.5, height: 45),
                  SizedBox(height: 25),
                  ShimmerContainer(width: 5, height: 30),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
