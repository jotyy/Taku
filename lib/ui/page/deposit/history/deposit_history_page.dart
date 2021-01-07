import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/l10n.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'deposit_history_view_model.dart';

class DepositHistoryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).cardColor,
      appBar: AppBar(
        title: Text(L10n.of(context).depositHistory),
      ),
      body: Column(
        children: [
          DepositHistoryBody(),
        ],
      ),
    );
  }
}

class DepositHistoryBody extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final viewModel = useProvider(depositHistoryViewModelProvider);
    final snapshot = useFuture(useMemoized(viewModel.fetchDepositHistory));

    if (!snapshot.hasData) return Container();

    final records = useProvider(
        depositHistoryViewModelProvider.select((value) => value.records));
    return records.when(
        success: (data) => ListView.builder(
            itemCount: data.length,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(data[index].record.code),
              );
            }),
        failure: (e) => Text('Error $e'));
  }
}
