import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class SearchInputBox extends HookWidget {
  final Future Function(String) onTextChange;

  SearchInputBox({this.onTextChange});

  @override
  Widget build(BuildContext context) {
    final controller = useTextEditingController();
    controller.addListener(() {
      onTextChange(controller.text.toString());
    });
    return Container(
      margin: const EdgeInsets.all(16.0),
      child: TextField(
        controller: controller,
        decoration: const InputDecoration(
            contentPadding: EdgeInsets.zero,
            border: OutlineInputBorder(
                borderSide: BorderSide(width: 0.5),
                borderRadius: BorderRadius.all(Radius.circular(46.0))),
            prefixIcon: Icon(Icons.search)),
      ),
    );
  }
}
