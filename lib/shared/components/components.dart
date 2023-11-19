import 'package:flutter/material.dart';

import '../styles/colors.dart';

class ShimmerContainer extends StatelessWidget {
  const ShimmerContainer({
    Key? key,
    this.width,
    required this.height,
    this.isDesktop = false,
  }) : super(key: key);

  final double? width;
  final double height;
  final bool isDesktop;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width == null
          ? (isDesktop ? 200 : 140)
          : MediaQuery.of(context).size.width / width!,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        color: Theme.of(context).cardColor,
      ),
    );
  }
}

/////////////////////////////

SnackBar snackBarMessage({
  required String Message,
  int? duration,
  Color? color,
  SnackBarAction? actionTextButton,
}) {
  return SnackBar(
    margin: EdgeInsets.all(6),
    behavior: SnackBarBehavior.floating,
    content: Text(Message),
    backgroundColor: color ?? AppColors.primaryColorS300,
    duration: Duration(seconds: duration ?? 8),
    action: actionTextButton,
  );
}
