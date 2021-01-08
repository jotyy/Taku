import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/l10n.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../data/model/deposit_record.dart';
import '../../../../gen/assets.gen.dart';
import '../../../../util/date_util.dart';
import 'deposit_history_view_model.dart';

class DepositHistoryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).cardColor,
      appBar: AppBar(
        title: Text(L10n.of(context).depositHistory),
        actions: [
          IconButton(
              icon: Assets.svgs.calendar.svg(),
              onPressed: () {
                showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime.now().subtract(const Duration(days: 90)),
                  lastDate: DateTime.now(),
                ).then(
                  (value) => context
                      .read(depositHistoryViewModelProvider)
                      .fetchDepositHistory(dateTime: value),
                );
              })
        ],
      ),
      body: DepositHistoryBody(),
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
        success: (data) => RefreshIndicator(
              onRefresh: viewModel.fetchDepositHistory,
              child: Container(
                height: double.infinity,
                child: ListView.builder(
                    itemCount: data.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return DepositHistoryItem(
                        detail: data[index],
                        onLongPress: () =>
                            viewModel.deleteHistory(data[index].record.id),
                      );
                    }),
              ),
            ),
        failure: (e) => Text('Error $e'));
  }
}

class DepositHistoryItem extends StatelessWidget {
  final DepositRecord detail;
  final VoidCallback onLongPress;

  const DepositHistoryItem({
    Key key,
    this.detail,
    this.onLongPress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Card(
        child: InkWell(
          onLongPress: onLongPress,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '入库编号',
                      style: Theme.of(context).textTheme.caption,
                    ),
                    Text(
                      detail.record.uuid.toString(),
                      style: Theme.of(context).textTheme.subtitle1,
                    ),
                  ],
                ),
                const Divider(),
                const Gap(8.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('商品'),
                    Text('${detail.commodity.name} ×${detail.record.amount}'),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('金额'),
                    Text('\$${detail.record.amount * detail.commodity.price}'),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('时间'),
                    Text(
                      '${DateUtil.formatDate(detail.record.depositAt)}',
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
