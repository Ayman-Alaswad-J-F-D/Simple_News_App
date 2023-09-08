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
            child: ListView.separated(
              itemCount: 3,
              itemBuilder: (context, index) => Shimmer.fromColors(
                baseColor: AppColors.greyS100,
                highlightColor: AppColors.white.withOpacity(0.8),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(17.0),
                      child: myContainer(200, 200),
                    ),
                    const SizedBox(width: 25),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        myContainer(450, 25),
                        SizedBox(height: 10),
                        myContainer(400, 30),
                        SizedBox(height: 10),
                        myContainer(400, 30),
                        SizedBox(height: 10),
                        myContainer(200, 25),
                      ],
                    ),
                  ],
                ),
              ),
              separatorBuilder: (context, index) => SizedBox(),
            ),
          ),
        ),
        Expanded(
          child: Shimmer.fromColors(
            baseColor: AppColors.greyS100,
            highlightColor: AppColors.white.withOpacity(0.9),
            child: Padding(
              padding: const EdgeInsets.all(17.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  myContainer(670, 300),
                  SizedBox(height: 30),
                  myContainer(630, 40),
                  SizedBox(height: 10),
                  myContainer(550, 55),
                  SizedBox(height: 25),
                  myContainer(250, 30)
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
