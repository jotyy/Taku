import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/l10n.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'deposit_view_model.dart';

class DepositHistoryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(L10n.of(context).depositHistory),
      ),
      body: DepositHistoryBody(),
    );
  }
}

class DepositHistoryBody extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final viewModel = useProvider(depositViewModelProvider);
    final snapshot = useFuture(useMemoized(viewModel.fetchCommodities));

    if (!snapshot.hasData) return Container();

    final records =
        useProvider(depositViewModelProvider.select((value) => value.records));
    return records.when(
        success: (data) => ListView.builder(
            itemCount: data.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(data[index].record.code),
              );
            }),
        failure: (e) => Text('Error $e'));
  }
}
