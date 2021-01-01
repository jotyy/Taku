import 'package:app/ui/widgets/gaps.dart';
import 'package:flutter/material.dart';

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
        Container(
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
              Gaps.hGap8,
              const Icon(Icons.chevron_right),
            ],
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
