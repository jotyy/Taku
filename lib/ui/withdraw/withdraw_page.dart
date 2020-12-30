import 'package:flutter/material.dart';

class WithdrawPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "出库",
          style: Theme.of(context).textTheme.headline1,
        ),
      ),
      body: Container(),
    );
  }
}
