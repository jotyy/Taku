import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/l10n.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get/get.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../constants.dart';
import '../../util/error_snackbar.dart';
import '../app_theme.dart';
import '../component/home_item.dart';
import '../component/image.dart';
import '../user_view_model.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(L10n.of(context).home,
              style: Theme.of(context).textTheme.headline1),
          actions: [
            // action button
            IconButton(
              icon: const Icon(Icons.color_lens),
              onPressed: () async => context
                  .read(appThemeNotifierProvider)
                  .toggle()
                  .catchError((error) {
                showErrorSnackbar(
                    L10n.of(context).error, L10n.of(context).failedSwitchTheme);
              }),
            ),
            IconButton(
                icon: HookBuilder(builder: (context) {
                  final user = useProvider(
                      userViewModelProvider.select((value) => value.user));
                  return CircleAvatar(
                    backgroundImage: loadProfileImage(user?.photoURL),
                    backgroundColor: Colors.transparent,
                    radius: 12,
                  );
                }),
                onPressed: () => Get.toNamed(Constants.pageSignIn))
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.fromLTRB(10, 40, 10, 40),
          child: Container(
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Card(
                        child: InkWell(
                            onTap: () => Get.toNamed(Constants.pageDeposit),
                            borderRadius: BorderRadius.circular(4.0),
                            child: Container(
                              width: 200,
                              height: 150,
                              child: const Padding(
                                  padding: EdgeInsets.all(12.0),
                                  child:
                                      HomeItem(title: "入库", icon: Icons.inbox)),
                            )),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Card(
                        child: InkWell(
                            onTap: () => Get.toNamed(Constants.pageSignIn),
                            borderRadius: BorderRadius.circular(4.0),
                            child: Container(
                              width: 200,
                              height: 150,
                              child: const Padding(
                                  padding: EdgeInsets.all(12.0),
                                  child: HomeItem(
                                      title: "出库", icon: Icons.outbox)),
                            )),
                      ),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Card(
                        child: InkWell(
                            onTap: () => Get.toNamed(Constants.pageStatistic),
                            borderRadius: BorderRadius.circular(4.0),
                            child: Container(
                              width: 200,
                              height: 150,
                              child: const Padding(
                                  padding: EdgeInsets.all(12.0),
                                  child: HomeItem(
                                      title: "统计", icon: Icons.bubble_chart)),
                            )),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}
