import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/l10n.dart';
import 'package:gap/gap.dart';

enum MenuSection {
  personalCenter,
  depositHistory,
  withdrawHistory,
  printCode,
}

class DrawerMenu extends StatelessWidget {
  final MenuSection currentCategory;
  final ValueChanged<MenuSection> onCategoryTap;
  final List<MenuSection> _categories = MenuSection.values;

  const DrawerMenu({
    Key key,
    @required this.currentCategory,
    @required this.onCategoryTap,
  });

  String getSectionName(BuildContext context, MenuSection section) {
    switch (section) {
      case MenuSection.personalCenter:
        return L10n.of(context).personalCenter;
        break;
      case MenuSection.depositHistory:
        return L10n.of(context).depositHistory;
        break;
      case MenuSection.withdrawHistory:
        return L10n.of(context).withdrawHistory;
        break;
      case MenuSection.printCode:
        return L10n.of(context).printCode;
        break;
      default:
        return "";
    }
  }

  Widget _buildCategory(MenuSection category, BuildContext context) {
    final categoryString = getSectionName(context, category);
    final theme = Theme.of(context);
    return GestureDetector(
        onTap: () => onCategoryTap(category),
        child: Column(
          children: <Widget>[
            const Gap(30.0),
            Text(
              categoryString,
              style: theme.textTheme.subtitle1.copyWith(color: Colors.white),
              textAlign: TextAlign.center,
            ),
            const Gap(10.0),
            Container(
              width: 100.0,
              height: 1.0,
              color: theme.accentColor.withAlpha(200),
            ),
          ],
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.only(top: 40.0),
        child: ListView(
            children:
                _categories.map((c) => _buildCategory(c, context)).toList()),
      ),
    );
  }
}
