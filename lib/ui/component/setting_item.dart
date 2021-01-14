import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingItem extends StatelessWidget {
  final String title;
  final Widget child;
  final VoidCallback onPressed;

  const SettingItem({Key key, this.title, this.child, this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: onPressed,
          child: Container(
            height: 48,
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              children: [
                Text(
                  title,
                  style: Get.theme.textTheme.subtitle2,
                ),
                const Spacer(),
                child == null ? const Icon(Icons.chevron_right) : child,
              ],
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.0),
          child: Divider(height: 1.0),
        )
      ],
    );
  }
}
