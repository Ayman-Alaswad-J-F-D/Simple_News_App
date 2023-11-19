import 'package:flutter/material.dart';

import '../../generated/l10n.dart';
import '../../shared/styles/colors.dart';

class DropdownBar extends StatelessWidget {
  const DropdownBar({
    Key? key,
    required this.isArabic,
    required this.cubit,
  }) : super(key: key);

  final isArabic;
  final cubit;

  @override
  Widget build(BuildContext context) {
    String dropdownValue = isArabic ? 'Arabic' : 'English';

    return Padding(
      padding: EdgeInsets.only(
        left: isArabic ? 20 : 0,
        right: isArabic ? 0 : 20,
      ),
      child: Center(
        child: DropdownButton<String>(
          underline: SizedBox(),
          iconEnabledColor: AppColors.primaryColor,
          style: Theme.of(context).textTheme.caption,
          icon: Icon(
            Icons.arrow_drop_down_rounded,
            color: Theme.of(context).iconTheme.color,
          ),
          value: dropdownValue,
          onChanged: (newValue) {
            dropdownValue = newValue!;
            cubit.changeLanguage(lang: newValue);
          },
          items: [
            DropdownMenuItem<String>(
              value: "English",
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 6),
                child: Text(S.of(context).English),
              ),
            ),
            DropdownMenuItem<String>(
              value: "Arabic",
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 6),
                child: Text(S.of(context).Arabic),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
