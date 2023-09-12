import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_app/app_cubit/app_cubit.dart';
import 'package:new_app/app_cubit/app_states.dart';
import '../styles/colors.dart';

Widget myContainer(double? width, double? height) =>
    BlocBuilder<AppCubit, AppStates>(
      builder: (context, state) => Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color: AppCubit.get(context).isDark
              ? AppColors.greyS100.withOpacity(.1)
              : AppColors.greyS100,
        ),
      ),
    );

/////////////////////////////

Widget myDivider() => const Padding(
      padding: EdgeInsets.only(left: 20.0),
      child: Divider(),
    );
