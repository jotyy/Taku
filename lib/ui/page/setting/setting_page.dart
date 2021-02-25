import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get/get.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../constants.dart';
import '../../app_theme.dart';
import '../../component/setting_item.dart';

class SettingPage extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final appTheme = context.read(appThemeNotifierProvider);
    final isDark = useProvider(appThemeNotifierProvider
        .select((value) => value.setting == ThemeMode.dark));

    return Scaffold(
      appBar: AppBar(
        title: const Text("设置"),
      ),
      backgroundColor: Theme.of(context).cardColor,
      body: Column(
        children: [
          SettingItem(
            title: '检查更新',
            onPressed: () {},
          ),
          SettingItem(
            title: '夜间模式',
            child: Switch(
              value: isDark,
              onChanged: (value) {
                context.read(appThemeNotifierProvider).toggle();
              },
            ),
          ),
          SettingItem(
            title: '关于',
            onPressed: () => Get.toNamed(Constants.pageAbout),
          ),
          SettingItem(
            title: '退出登录',
            onPressed: () => Get.defaultDialog(
              title: "退出登录",
              middleText: "确定要退出吗？",
              textConfirm: "确定",
              textCancel: "取消",
              // TODO logout
            ),
          ),
        ],
      ),
    );
  }
}
