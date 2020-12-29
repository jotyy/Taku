import 'package:flutter/material.dart';

/// Item of home page
class HomeItem extends StatelessWidget {
  final String title;
  final IconData icon;

  const HomeItem({Key key, this.title, this.icon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
                decoration: BoxDecoration(
                    color: Colors.black12,
                    borderRadius: BorderRadius.circular(36.0)),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(child: Icon(icon, size: 48.0)),
                ))
          ],
        ),
        const SizedBox(height: 10.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style:
                  const TextStyle(fontSize: 14.0, fontWeight: FontWeight.w300),
            )
          ],
        )
      ],
    );
  }
}
