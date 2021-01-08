import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/l10n.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../gen/assets.gen.dart';
import '../../../../util/date_util.dart';
import '../../../component/deposit_history_item.dart';
import 'deposit_history_view_model.dart';

class DepositHistoryPage extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final dateTime = useState(DateTime.now());

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
                  initialDate: dateTime.value,
                  firstDate: DateTime.now().subtract(const Duration(days: 90)),
                  lastDate: DateTime.now(),
                ).then(
                  (value) {
                    dateTime.value = value;
                    context
                        .read(depositHistoryViewModelProvider)
                        .fetchDepositHistory(dateTime: dateTime.value);
                  },
                );
              })
        ],
      ),
      body: DepositHistoryBody(
          DateUtil.formatDate(dateTime.value, format: 'yyyy/MM/dd')),
    );
  }
}

class DepositHistoryBody extends HookWidget {
  final String date;

  DepositHistoryBody(this.date);

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
              child: Column(
                children: [
                  const Gap(20.0),
                  DefaultTextStyle(
                    style: Theme.of(context).textTheme.caption,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(date),
                        const Gap(5.0),
                        Text('共${data.length}条记录'),
                        const Gap(20.0)
                      ],
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: double.infinity,
                      child: ListView.builder(
                          itemCount: data.length,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return DepositHistoryItem(
                              detail: data[index],
                              onLongPress: () => viewModel
                                  .deleteHistory(data[index].record.id),
                            );
                          }),
                    ),
                  ),
                ],
              ),
            ),
        failure: (e) => Text('Error $e'));
  }
}
