import 'package:flutter/material.dart';

class DepositDetailItem extends StatelessWidget {
  final String name;
  final String value;

  const DepositDetailItem({Key key, this.name, this.value}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(0, 0, 0, 4),
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              name,
              style: const TextStyle(fontWeight: FontWeight.w600),
            ),
            Text(value),
          ],
        ),
      ),
    );
  }
}
