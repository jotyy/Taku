import 'package:app/ui/component/my_flexible_space_bar.dart';
import 'package:app/ui/page/statistic/statistic_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:gap/gap.dart';

import '../../app_theme.dart';
import '../../component/setting_item.dart';

class SettingPage extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final isDark = useState(false);

    return Scaffold(
      body: Stack(fit: StackFit.expand, children: [
        Container(
          height: 200.0,
          decoration: BoxDecoration(
            color: Theme.of(context).accentColor,
            borderRadius: BorderRadius.vertical(
                bottom:
                    Radius.elliptical(MediaQuery.of(context).size.width, 80.0)),
          ),
        ),
        Positioned(
          top: 120,
          child: Container(
            height: double.infinity,
            width: double.infinity,
            child: Column(
              children: [
                SettingItem(
                  title: '检查更新',
                  onPressed: () {},
                ),
                SettingItem(
                  title: '夜间模式',
                  child: Switch(
                    value: isDark.value,
                    onChanged: (value) {
                      context.read(appThemeNotifierProvider).toggle();
                      isDark.value = !isDark.value;
                    },
                  ),
                ),
                SettingItem(
                  title: '使用帮助',
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
              ],
            ),
          ),
        ),
      ]),
    );
  }
}
