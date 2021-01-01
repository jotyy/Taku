import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/l10n.dart';

import '../../widgets/gaps.dart';
import '../../widgets/my_button.dart';
import '../../widgets/my_scoll_view.dart';
import '../../widgets/text_field_item.dart';

class InputCommodityPage extends StatelessWidget {
  final FocusNode _nodeName = FocusNode();

  @override
  Widget build(BuildContext context) {
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
            onPressed: () {},
            text: '提交',
          ),
        ),
      ),
    );
  }

  List<Widget> _buildBody(BuildContext context) {
    final theme = Theme.of(context);
    return [
      Gaps.vGap5,
      Padding(
        padding: const EdgeInsets.only(left: 16.0),
        child: Text(
          '商品资料',
          style: theme.textTheme.subtitle2,
        ),
      ),
      Gaps.vGap16,
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
      Gaps.vGap10,
      Center(
        child: Text(
          '点击上传商品图片',
          style: theme.textTheme.caption,
        ),
      ),
      Gaps.vGap24,
      TextFieldItem(
        focusNode: _nodeName,
        title: '商品名称',
        hintText: '填写商品名称',
      ),
      TextFieldItem(
        focusNode: _nodeName,
        title: '商品编码',
        hintText: '填写商品编码',
      ),
      TextFieldItem(
        focusNode: _nodeName,
        title: '商品名称',
        hintText: '填写商品名称',
      ),
    ];
  }
}
