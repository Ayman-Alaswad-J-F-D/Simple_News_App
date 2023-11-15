import 'package:flutter/material.dart';

extension NavigatorPush on BuildContext {
  toScreen({Widget? screen}) =>
      Navigator.push(this, MaterialPageRoute(builder: (context) => screen!));
}

extension NavigatorPushAndRemoveUntil on BuildContext {
  toScreenAndRemoce({Widget? screen}) => Navigator.pushAndRemoveUntil(
        this,
        MaterialPageRoute(builder: (context) => screen!),
        (route) => false,
      );
}

extension NavigatorBack on BuildContext {
  back(context) => Navigator.of(context).pop();
}
