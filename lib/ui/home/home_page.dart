import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/l10n.dart';
import 'package:get/get.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../constants.dart';
import '../../util/error_snackbar.dart';
import '../app_theme.dart';
import '../component/home_item.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: BottomAppBar(
          child: Row(
            children: [
              IconButton(icon: const Icon(Icons.menu), onPressed: () {}),
              const Spacer(),
              IconButton(
                icon: const Icon(Icons.color_lens),
                onPressed: () async => context
                    .read(appThemeNotifierProvider)
                    .toggle()
                    .catchError((error) {
                  showErrorSnackbar(L10n.of(context).error,
                      L10n.of(context).failedSwitchTheme);
                }),
              ),
              IconButton(icon: const Icon(Icons.settings), onPressed: () {})
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Get.toNamed(Constants.pageQRScanner);
          },
          child: const Icon(Icons.qr_code_scanner),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
        body: Column(
          children: [
            Material(
              elevation: 16,
              borderRadius: const BorderRadius.only(
                  bottomRight: Radius.elliptical(500, 70),
                  bottomLeft: Radius.elliptical(500, 70)),
              color: Colors.transparent,
              child: Container(
                width: double.infinity,
                height: 200,
                padding: const EdgeInsets.only(bottom: 12),
                child: Container(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('欢迎使用我的仓库',
                        style: Theme.of(context)
                            .textTheme
                            .headline1
                            .copyWith(color: Colors.white)),
                    const SizedBox(
                      height: 10,
                    ),
                    Text('开始你的第一笔记录',
                        style: Theme.of(context)
                            .textTheme
                            .subtitle2
                            .copyWith(color: Colors.white70)),
                  ],
                )),
                decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    boxShadow: [
                      BoxShadow(
                          color: Theme.of(context).shadowColor,
                          offset: const Offset(0, 4),
                          blurRadius: 6)
                    ],
                    borderRadius: const BorderRadius.only(
                        bottomRight: Radius.elliptical(500, 70),
                        bottomLeft: Radius.elliptical(500, 70))),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: HomeItem(
                            title: '入库',
                            icon: Icons.inbox,
                            clickListener: () =>
                                Get.toNamed(Constants.pageDeposit),
                          )),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: HomeItem(
                            title: '出库',
                            icon: Icons.outbox,
                            clickListener: () =>
                                Get.toNamed(Constants.pageWithdraw),
                          )),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: HomeItem(
                            title: '统计',
                            icon: Icons.bubble_chart,
                            clickListener: () =>
                                Get.toNamed(Constants.pageStatistic),
                          )),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
