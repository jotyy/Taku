import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/l10n.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

import '../../../constants.dart';
import '../../../gen/assets.gen.dart';
import '../../component/backdrop.dart';
import '../../component/drawer_menu.dart';
import '../../component/home_item.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Backdrop(
      frontLayer: DrawerMenu(),
      backLayer: _homeScreen(context),
    );
  }

  Widget _homeScreen(BuildContext context) {
    return Column(
      children: [
        const Gap(50.0),
        HomeItem(
          title: L10n.of(context).deposit,
          icon: Assets.svgs.icHomeIn.svg(
            width: 36,
            height: 36,
            color: Theme.of(context).accentIconTheme.color.withAlpha(200),
          ),
          onTap: () => Get.toNamed(Constants.pageDeposit),
        ),
        HomeItem(
          title: L10n.of(context).withdraw,
          icon: Assets.svgs.icHomeOut.svg(
            width: 36,
            height: 36,
            color: Theme.of(context).accentIconTheme.color.withAlpha(200),
          ),
          onTap: () => Get.toNamed(Constants.pageWithdraw),
        ),
        HomeItem(
          title: L10n.of(context).statistic,
          icon: Assets.svgs.chart.svg(
            width: 36,
            height: 36,
            color: Theme.of(context).accentIconTheme.color.withAlpha(200),
          ),
          onTap: () => Get.toNamed(Constants.pageStatistic),
        )
      ],
    );
  }
}
