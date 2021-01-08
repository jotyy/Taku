import 'package:app/data/model/deposit_record.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/l10n.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../gen/assets.gen.dart';
import 'deposit_history_view_model.dart';

class DepositHistoryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).cardColor,
      appBar: AppBar(
        title: Text(L10n.of(context).depositHistory),
        actions: [
          IconButton(icon: Assets.svgs.calendar.svg(), onPressed: () {})
        ],
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
              return DepositHistoryItem(detail: data[index]);
            }),
        failure: (e) => Text('Error $e'));
  }
}

class DepositHistoryItem extends StatelessWidget {
  final DepositRecord detail;

  const DepositHistoryItem({Key key, this.detail}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Text(
            '入库编号',
            style: Theme.of(context).textTheme.caption,
          ),
          Text(detail.record.uuid.toString()),
        ],
      ),
    );
  }
}
