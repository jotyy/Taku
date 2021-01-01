import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  const MyButton({
    Key key,
    this.text = '',
    @required this.onPressed,
  }) : super(key: key);

  final String text;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      onPressed: onPressed,
      child: Container(
        color: Colors.transparent,
        height: 48,
        width: double.infinity,
        alignment: Alignment.center,
        child: Text(text),
      ),
    );
  }
}
