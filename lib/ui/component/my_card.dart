import 'package:flutter/material.dart';

class MyCard extends StatelessWidget {
  final Widget child;
  final Color color;
  final Color shadowColor;

  const MyCard({Key key, @required this.child, this.color, this.shadowColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _shadowColor =
        shadowColor == null ? Theme.of(context).shadowColor : shadowColor;
    return DecoratedBox(
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(8.0),
        boxShadow: [
          BoxShadow(
            color: _shadowColor,
            offset: const Offset(0, 2),
            blurRadius: 8.0,
            spreadRadius: 0.0,
          )
        ],
      ),
      child: child,
    );
  }
}
