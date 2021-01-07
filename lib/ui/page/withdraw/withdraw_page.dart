import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/l10n.dart';

class WithdrawPage extends StatefulWidget {
  @override
  _WithdrawPageState createState() => _WithdrawPageState();
}

class _WithdrawPageState extends State<WithdrawPage>
    with SingleTickerProviderStateMixin {
  final _tabs = ['待出库', '已出库'];
  TabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TabController(length: _tabs.length, vsync: this)
      ..addListener(() { });
  }

  @override
  Widget build(BuildContext context) {
    // final viewModel = context.read(withdrawViewModelProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          L10n.of(context).withdraw,
        ),
        bottom: TabBar(
          indicatorSize: TabBarIndicatorSize.label,
          controller: _controller,
          tabs: _tabs.map((e) => Tab(text: e)).toList(),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.calendar_today_sharp),
            onPressed: () {},
          )
        ],
      ),
      body: Container()
    );
  }
}
