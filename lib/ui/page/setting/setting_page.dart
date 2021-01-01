import 'package:flutter/material.dart';

import '../../component/setting_item.dart';
import '../../widgets/gaps.dart';
import '../../widgets/my_scoll_view.dart';

class SettingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('设置'),
      ),
      body: MyScrollView(children: _buildBody),
    );
  }

  List<Widget> get _buildBody {
    return [
      Gaps.vGap16,
      SettingItem(
        title: '清除缓存',
        hintText: '12MB',
        onPressed: () {},
      ),
      SettingItem(
        title: '夜间模式',
        hintText: '跟随系统',
        onPressed: () {},
      ),
      SettingItem(
        title: '关于',
        onPressed: () {},
      ),
      SettingItem(
        title: '退出登录',
        onPressed: () {},
      ),
    ];
  }
}
