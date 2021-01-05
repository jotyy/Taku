import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class SearchInputBox extends HookWidget {
  final String hintText;
  final Future Function(String) onTextChange;

  SearchInputBox({this.hintText, this.onTextChange});

  @override
  Widget build(BuildContext context) {
    final controller =
        useTextEditingController.fromValue(TextEditingValue.empty);
    controller.addListener(() {
      onTextChange(controller.text.toString());
    });
    return Container(
      margin: const EdgeInsets.all(16.0),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
            hintText: hintText,
            contentPadding: EdgeInsets.zero,
            filled: true,
            fillColor: Colors.grey.withAlpha(30),
            border: const OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.all(Radius.circular(46.0))),
            prefixIcon: const Icon(Icons.search)),
      ),
    );
  }
}
