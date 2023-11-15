import 'package:flutter/material.dart';

class PopupItem extends StatelessWidget {
  const PopupItem({
    Key? key,
    required this.text,
    required this.icon,
  }) : super(key: key);

  final String text;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        text,
        style: Theme.of(context).textTheme.caption,
      ),
      leading: Icon(
        icon,
        color: Theme.of(context).iconTheme.color,
      ),
    );
  }
}
