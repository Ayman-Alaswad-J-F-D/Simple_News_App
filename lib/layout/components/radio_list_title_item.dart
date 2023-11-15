import 'package:flutter/material.dart';
import 'package:new_app/shared/extension/extension_navigation.dart';
import 'package:new_app/shared/styles/colors.dart';

import '../../logic/cubit/cubit.dart';

class RadioListTileItem extends StatelessWidget {
  const RadioListTileItem({
    Key? key,
    required this.text,
    required this.index,
    required this.cubit,
  }) : super(key: key);

  final String text;
  final int index;
  final BreakingNewsAppCubit cubit;

  @override
  Widget build(BuildContext context) {
    return RadioListTile<String>(
      selected:
          cubit.languageOptions[index] == cubit.appLanguage ? true : false,
      title: Text(
        text,
        style: Theme.of(context).textTheme.caption?.copyWith(
              color: cubit.languageOptions[index] != cubit.appLanguage
                  ? AppColors.primaryColorS300
                  : null,
            ),
      ),
      value: cubit.languageOptions[index],
      groupValue:
          cubit.appLanguage, // EN or AR From Cache or after change Theme
      onChanged: (value) {
        cubit.changeLanguage(language: value); // Set EN or AR
        context.back(context);
      },
    );
  }
}
