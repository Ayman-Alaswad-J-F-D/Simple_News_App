import 'package:flutter/material.dart';

import '../../generated/l10n.dart';
import '../../logic/cubit/cubit.dart';
import 'poup_item.dart';
import 'radio_list_title_item.dart';

class PopupMenuApp extends StatelessWidget {
  const PopupMenuApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: PopupMenuButton<String>(
        onSelected: (value) => choiceAction(value, context),
        itemBuilder: (context) {
          return [
            PopupMenuItem<String>(
              padding: EdgeInsets.zero,
              value: 'Dark Mode',
              child: PopupItem(
                text: BreakingNewsAppCubit.get(context).isDark
                    ? S.of(context).LightMode
                    : S.of(context).DarkMode,
                icon: Icons.brightness_4_outlined,
              ),
            ),
            PopupMenuItem<String>(
              padding: EdgeInsets.zero,
              value: 'Change Language',
              child: PopupItem(
                text: S.of(context).ChangeLanguage,
                icon: Icons.language_outlined,
              ),
            ),
          ];
        },
      ),
    );
  }

  void choiceAction(String choice, BuildContext context) {
    final cubit = BreakingNewsAppCubit.get(context);
    if (choice == 'Dark Mode') {
      cubit.changeThemeMode();
    } else if (choice == 'Change Language') {
      final List<String> language = [
        S.of(context).English,
        S.of(context).Arabic,
      ];
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          title: Text(
            '${S.of(context).ChoiceLanguage} :',
            style: Theme.of(context).textTheme.bodyText1,
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: List<Widget>.generate(
              language.length,
              (index) => RadioListTileItem(
                text: language[index],
                cubit: cubit,
                index: index,
                // option: 'en',
              ),
            ),
          ),
        ),
      );
    }
  }
}
