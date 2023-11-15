import 'package:flutter/material.dart';

import '../../generated/l10n.dart';

List<NavigationRailDestination> bottomNavItemForDesktop(context) => [
      NavigationRailDestination(
        label: Text(S.of(context).LabelGen),
        icon: Icon(Icons.newspaper_sharp),
        selectedIcon: Icon(Icons.newspaper_rounded),
      ),
      NavigationRailDestination(
        label: Text(S.of(context).LabelSpo),
        icon: Icon(Icons.sports_football_rounded),
        selectedIcon: Icon(Icons.sports_football_outlined),
      ),
      NavigationRailDestination(
        label: Text(S.of(context).LabelTec),
        icon: Icon(Icons.psychology_rounded),
        selectedIcon: Icon(Icons.psychology_outlined),
      ),
    ];

List<NavigationDestination> bottomNavItemForMobile(context) => [
      NavigationDestination(
        label: S.of(context).LabelGen,
        icon: Icon(Icons.newspaper_sharp),
        selectedIcon: Icon(Icons.newspaper_rounded),
      ),
      NavigationDestination(
        label: S.of(context).LabelSpo,
        icon: Icon(Icons.sports_football_rounded),
        selectedIcon: Icon(Icons.sports_football_outlined),
      ),
      NavigationDestination(
        label: S.of(context).LabelTec,
        icon: Icon(Icons.psychology_rounded),
        selectedIcon: Icon(Icons.psychology_outlined),
      ),
    ];
