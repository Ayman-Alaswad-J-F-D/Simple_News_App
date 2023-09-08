import 'package:flutter/material.dart';

import '../cubit/cubit.dart';
import 'articles_builder.dart';

class BuilderMobile extends StatelessWidget {
  const BuilderMobile({
    Key? key,
    required this.cubit,
    required this.list,
  }) : super(key: key);

  final BreakingNewsAppCubit cubit;
  final List list;

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (BuildContext context) {
        cubit.isDesktop == false
            ? ArticlesBuilder(list: list)
            : cubit.setDesktop(false);
        return ArticlesBuilder(list: list);
      },
    );
  }
}
