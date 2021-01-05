import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/l10n.dart';
import 'package:get/get.dart';

import '../../../constants.dart';
import '../../../gen/assets.gen.dart';
import '../../component/search_input_box.dart';
import '../../widgets/my_button.dart';
import '../../widgets/my_scroll_view.dart';

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
              onPressed: () => Get.toNamed(Constants.pageQRScanner))
        ],
      ),
      body: MyScrollView(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SearchInputBox(
                hintText: '请输入商品名称',
              ),
            ],
          ),
        ],
        bottomButton: Padding(
          padding: const EdgeInsets.all(16.0),
          child: MyButton(text: '提交', onPressed: () {}),
        ),
      ),
    );
  }
}
