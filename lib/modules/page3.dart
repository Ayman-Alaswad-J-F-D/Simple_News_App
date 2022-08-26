// ignore_for_file: prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../shared/components/components.dart';
import '../shared/cubit/cubit.dart';
import '../shared/cubit/states.dart';

class Page3Screen extends StatelessWidget {
  Page3Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewAppCubit, NewAppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var list = NewAppCubit.get(context).page3;
        return articlesBuilder(list, context);
      },
    );
  }
}
