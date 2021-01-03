import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../component/setting_item.dart';
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
      const Gap(16),
      SettingItem(
        title: '检查更新',
        onPressed: () {},
      ),
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
