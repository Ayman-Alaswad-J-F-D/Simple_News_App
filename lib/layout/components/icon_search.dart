import 'package:flutter/material.dart';

class IconSearch extends StatelessWidget {
  const IconSearch({
    Key? key,
    required this.icon,
    required this.onPressed,
  }) : super(key: key);

  final IconData icon;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return IconButton(icon: Icon(icon), onPressed: onPressed);
  }
}
