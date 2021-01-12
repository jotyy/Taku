import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/l10n.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../gen/assets.gen.dart';
import '../../component/bar_code_scanner.dart';
import '../../widgets/my_button.dart';
import '../../widgets/my_scroll_view.dart';
import '../../widgets/text_field_item.dart';
import 'commodity_view_model.dart';

class InputCommodityPage extends StatelessWidget {
  final FocusNode _nodeName = FocusNode();
  final FocusNode _nodeDesc = FocusNode();
  final FocusNode _nodePrice = FocusNode();
  final FocusNode _nodeCode = FocusNode();
  final _nameController = TextEditingController();
  final _descController = TextEditingController();
  final _priceController = TextEditingController();
  final _codeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final String code = Get.arguments;
    _codeController.text = code;
    final viewModel = context.read(commodityViewModelProvider);
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
            onPressed: () {
              viewModel.addCommodity(
                _nameController.text.toString(),
                _descController.text.toString(),
                _priceController.text.toString(),
                _codeController.text.toString(),
              );
            },
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
        controller: _nameController,
        title: '商品名称',
        hintText: '请填写商品名称',
      ),
      TextFieldItem(
        focusNode: _nodeDesc,
        controller: _descController,
        title: '商品描述',
        hintText: '请填写商品描述',
      ),
      TextFieldItem(
        focusNode: _nodePrice,
        controller: _priceController,
        title: '商品价格',
        hintText: '请填写商品价格',
        keyboardType: TextInputType.number,
      ),
      Stack(
        children: [
          TextFieldItem(
            focusNode: _nodeCode,
            controller: _codeController,
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
              onPressed: () async {
                final code = await Get.to(const BarCodeScanner());
                _codeController.text = code;
              },
            ),
          )
        ],
      ),
    ];
  }
}
