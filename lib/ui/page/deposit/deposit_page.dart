import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/l10n.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../constants.dart';
import '../../../data/local/app_database.dart';
import '../../../gen/assets.gen.dart';
import '../../component/deposit_list_item.dart';
import '../../widgets/my_button.dart';
import '../../widgets/my_scroll_view.dart';
import 'deposit_view_model.dart';

class DepositPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(L10n.of(context).deposit),
        actions: [
          IconButton(
              icon: Assets.svgs.icScanner.svg(
                width: 24,
                height: 24,
                color: Theme.of(context).primaryIconTheme.color,
              ),
              onPressed: () async {
                var scanResult = await Get.toNamed(Constants.pageQRScanner);
                if (scanResult != null) {
                  context
                      .read(depositViewModelProvider)
                      .addDepositItem(1, scanResult as Commodity);
                }
              })
        ],
      ),
      body: MyScrollView(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: '请扫描/输入商品编码',
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
                filled: true,
                fillColor: Colors.grey.withAlpha(30),
                border: const OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.all(Radius.circular(46.0))),
              ),
            ),
          ),
          DepositList(),
        ],
        bottomButton: Padding(
          padding: const EdgeInsets.all(16.0),
          child: MyButton(
            text: '提交',
            onPressed: () => context.read(depositViewModelProvider).submit(),
          ),
        ),
      ),
    );
  }
}

class DepositList extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final viewModel = useProvider(depositViewModelProvider);

    return viewModel.depositList.isEmpty
        ? Container()
        : ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            itemCount: viewModel.depositList.length,
            itemBuilder: (context, index) {
              return DepositListItem(
                index: index,
                item: viewModel.depositList[index],
              );
            });
  }
}
