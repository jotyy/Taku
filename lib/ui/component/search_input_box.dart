import 'package:flutter/material.dart';

class SearchInputBox extends StatefulWidget {
  final Future Function(String) onTextChange;

  SearchInputBox({this.onTextChange});

  @override
  _SearchInputBoxState createState() => _SearchInputBoxState();
}

class _SearchInputBoxState extends State<SearchInputBox> {
  TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController.fromValue(TextEditingValue.empty)
      ..addListener(() {
        widget.onTextChange(_controller.text.toString());
      });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16.0),
      child: TextField(
        controller: _controller,
        decoration: InputDecoration(
            filled: true,
            fillColor: Theme.of(context).scaffoldBackgroundColor,
            contentPadding: EdgeInsets.zero,
            border: const OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.all(Radius.circular(46.0))),
            prefixIcon: const Icon(Icons.search)),
      ),
    );
  }
}
