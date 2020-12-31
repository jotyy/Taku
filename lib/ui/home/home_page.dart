import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/l10n.dart';
import 'package:get/get.dart';

import '../../constants.dart';
import '../component/backdrop.dart';
import '../component/drawer_menu.dart';
import '../component/home_item.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Backdrop(
      frontLayer: DrawerMenu(
        currentCategory: MenuSection.personalCenter,
        onCategoryTap: (value) {},
      ),
      backLayer: _homeScreen(context),
    );
  }

  Widget _homeScreen(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 56),
        HomeItem(
          title: L10n.of(context).deposit,
          icon: Icons.inbox,
          onTap: () => Get.toNamed(Constants.pageDeposit),
        ),
        HomeItem(
          title: L10n.of(context).withdraw,
          icon: Icons.outbox,
          onTap: () => Get.toNamed(Constants.pageWithdraw),
        ),
        HomeItem(
          title: L10n.of(context).statistic,
          icon: Icons.multiline_chart,
          onTap: () => Get.toNamed(Constants.pageStatistic),
        )
      ],
    );
  }
}
