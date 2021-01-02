import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/l10n.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../gen/assets.gen.dart';
import '../../widgets/my_button.dart';
import '../../widgets/my_scoll_view.dart';
import '../../widgets/text_field_item.dart';
import 'input_commodity_view_model.dart';

class InputCommodityPage extends StatelessWidget {
  final FocusNode _nodeName = FocusNode();
  final FocusNode _nodeDesc = FocusNode();
  final FocusNode _nodePrice = FocusNode();
  final FocusNode _nodeCode = FocusNode();

  @override
  Widget build(BuildContext context) {
    final viewModel = context.read(inputCommodityViewModelProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text(L10n.of(context).inputCommodity),
      ),
      body: MyScrollView(
        padding: const EdgeInsets.symmetric(vertical: 16.0),
        children: _buildBody(context),
        bottomButton: Padding(
          padding: const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 8.0),
          child: MyButton(
            onPressed: viewModel.submitCommodity,
            text: '提交',
          ),
        ),
      ),
    );
  }

  List<Widget> _buildBody(BuildContext context) {
    final theme = Theme.of(context);
    return [
      const Gap(5),
      Padding(
        padding: const EdgeInsets.only(left: 16.0),
        child: Text(
          '商品资料',
          style: theme.textTheme.caption,
        ),
      ),
      const Gap(16),
      Center(
        child: Container(
          decoration:
              BoxDecoration(border: Border.all(color: theme.dividerColor)),
          child: const Padding(
            padding: EdgeInsets.all(20.0),
            child: Icon(
              Icons.add_a_photo,
              size: 36,
            ),
          ),
        ),
      ),
      const Gap(10),
      Center(
        child: Text(
          '点击上传商品图片',
          style: theme.textTheme.caption,
        ),
      ),
      const Gap(24),
      TextFieldItem(
        focusNode: _nodeName,
        title: '商品名称',
        hintText: '请填写商品名称',
      ),
      TextFieldItem(
        focusNode: _nodeDesc,
        title: '商品描述',
        hintText: '请填写商品描述',
      ),
      TextFieldItem(
        focusNode: _nodePrice,
        title: '商品价格',
        hintText: '请填写商品价格',
      ),
      Stack(
        children: [
          TextFieldItem(
            focusNode: _nodeCode,
            title: '商品编码',
            hintText: '请填写/扫描商品编码',
          ),
          Align(
            alignment: Alignment.centerRight,
            child: IconButton(
              icon: Assets.svgs.icScanner.svg(
                width: 24,
                height: 24,
                color: Theme.of(context).iconTheme.color.withAlpha(180),
              ),
              onPressed: () {},
            ),
          )
        ],
      ),
    ];
  }
}
