import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/l10n.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get/get.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:moor/moor.dart' as moor;

import '../../../constants.dart';
import '../../../data/local/app_database.dart';
import '../../../gen/assets.gen.dart';
import '../../component/container_with_loading.dart';
import '../../component/deposit_list_item.dart';
import '../../loading_state_view_model.dart';
import 'deposit_view_model.dart';

class DepositPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final viewModel = context.read(depositViewModelProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(L10n.of(context).deposit,
            style: Theme.of(context).textTheme.headline1),
        actions: [
          IconButton(icon: const Icon(Icons.add_box), onPressed: () {})
        ],
      ),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 76.0,
              padding: const EdgeInsets.all(10.0),
              child: const TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(50.0))),
                    hintText: "请输入物品名称",
                    prefixIcon: Icon(Icons.search_rounded)),
              ),
            ),
            Expanded(
              child: Container(),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () => Get.toNamed(Constants.pageQRScanner),
          child: Assets.svgs.icScanner.svg(width: 24, height: 24)),
    );
  }
}
