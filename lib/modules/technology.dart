import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../shared/components/components.dart';
import '../shared/cubit/cubit.dart';
import '../shared/cubit/states.dart';

class TechnologyScreen extends StatelessWidget {
  TechnologyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewAppCubit, NewAppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var list = NewAppCubit.get(context).technologyList;
        return ScreenTypeLayout(
          mobile: Builder(
            builder: (BuildContext context) {
              NewAppCubit.get(context).isDesktop == false
                  ? articlesBuilder(list, context)
                  : NewAppCubit.get(context).setDesktop(false);
              return articlesBuilder(list, context);
            },
          ),
          desktop: Builder(
            builder: (BuildContext context) {
              NewAppCubit.get(context).isDesktop
                  ? desktopItem(list, context)
                  : NewAppCubit.get(context).setDesktop(true);
              return desktopItem(list, context);
            },
          ),
          breakpoints: ScreenBreakpoints(desktop: 700, tablet: 600, watch: 100),
        );
      },
    );
  }
}
