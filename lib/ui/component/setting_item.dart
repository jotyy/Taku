import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class SettingItem extends StatelessWidget {
  final String title;
  final String hintText;
  final VoidCallback onPressed;

  const SettingItem({Key key, this.title, this.hintText = '', this.onPressed})
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
                Text(title),
                const Spacer(),
                Text(
                  hintText,
                  style: Theme.of(context).textTheme.caption,
                ),
                const Gap(8),
                const Icon(Icons.chevron_right),
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
