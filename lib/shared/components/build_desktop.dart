import 'package:flutter/material.dart';

import '../cubit/cubit.dart';
import 'desktop_items.dart';

class BuilderDesktop extends StatelessWidget {
  const BuilderDesktop({
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
        cubit.isDesktop ? DesktopItems(list: list) : cubit.setDesktop(true);
        return DesktopItems(list: list);
      },
    );
  }
}
