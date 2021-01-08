import 'package:flutter/material.dart';

extension DialogExt on BuildContext {
  void showAlertDialog(String alertTitle, String alertMessage,
      {VoidCallback onConfirm}) {
    Widget cancelButton = FlatButton(
      child: const Text("Cancel"),
      onPressed: () {
        Navigator.pop(this);
      },
    );
    Widget continueButton = FlatButton(
      child: const Text("OK"),
      onPressed: () {
        onConfirm?.call();
        Navigator.pop(this);
      },
    );

    // set up the AlertDialog
    var alert = AlertDialog(
      title: Text(alertTitle),
      content: SingleChildScrollView(
        child: ListBody(
          children: <Widget>[Text(alertMessage)],
        ),
      ),
      actions: [
        cancelButton,
        continueButton,
      ],
    );

    // show the dialog
    showDialog(
      context: this,
      builder: (context) {
        return alert;
      },
    );
  }
}
