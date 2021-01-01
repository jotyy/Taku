import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/l10n.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../component/container_with_loading.dart';
import '../../component/deposit_list_item.dart';
import '../../loading_state_view_model.dart';
import 'withdraw_view_model.dart';

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
    final viewModel = context.read(withdrawViewModelProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          L10n.of(context).withdraw,
        ),
        bottom: TabBar(
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
      body: ContainerWithLoading(child: HookBuilder(builder: (context) {
        final commodities = useProvider(
            withdrawViewModelProvider.select((value) => value.commodities));
        final snapshot = useFuture(useMemoized(() {
          return context
              .read(loadingStateProvider)
              .whileLoading(viewModel.fetchCommodities);
        }, [commodities.toString()]));

        if (!snapshot.hasData) return Container();

        return commodities.when(success: (data) {
          if (data.isEmpty) {
            return const Center(child: Text('Empty screen'));
          }
          return RefreshIndicator(
            child: ListView.builder(
                itemCount: data.length,
                scrollDirection: Axis.vertical,
                itemBuilder: (_, index) {
                  return DepositListItem(
                    commodity: data[index],
                  );
                }),
            onRefresh: viewModel.fetchCommodities,
          );
        }, failure: (e) {
          return Center(
            child: Text("Failure $e"),
          );
        });
      })),
    );
  }
}
