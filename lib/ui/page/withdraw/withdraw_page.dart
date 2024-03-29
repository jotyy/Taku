import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/l10n.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../gen/assets.gen.dart';
import '../../../util/ext/async_snapshot.dart';
import '../../component/container_with_loading.dart';
import '../../component/date_selecter.dart';
import '../../component/withdraw_item.dart';
import '../../component/withdrawed_item.dart';
import '../../loading_state_view_model.dart';
import 'withdraw_view_model.dart';

class WithdrawPage extends HookWidget {
  final _tabs = ['待出库', '已出库'];

  @override
  Widget build(BuildContext context) {
    final dateTime = useState(DateTime.now());
    final tabController = useTabController(initialLength: 2, keys: _tabs);

    return Scaffold(
        appBar: AppBar(
          title: Text(
            L10n.of(context).withdraw,
          ),
          bottom: TabBar(
            indicatorSize: TabBarIndicatorSize.label,
            controller: tabController,
            tabs: _tabs.map((e) => Tab(text: e)).toList(),
          ),
          actions: [
            IconButton(
              icon: Assets.svgs.calendar.svg(),
              onPressed: () {
                showDatePicker(
                  context: context,
                  initialDate: dateTime.value,
                  firstDate: DateTime.now().subtract(const Duration(days: 90)),
                  lastDate: DateTime.now(),
                ).then((value) {
                  dateTime.value = value;
                });
              },
            )
          ],
        ),
        body: TabBarView(
          controller: tabController,
          children: [
            UnWithdrawScreen(),
            WithdrawedScreen(),
          ],
        ));
  }
}

class UnWithdrawScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ContainerWithLoading(
      child: HookBuilder(builder: (context) {
        final viewModel = useProvider(withdrawViewModelProvider);
        final listData = useProvider(
            withdrawViewModelProvider.select((value) => value.unWithdrawList));
        final snapshot = useFuture(useMemoized(() {
          return context
              .read(loadingStateProvider)
              .whileLoading(viewModel.fetchUnWithdrawedRecord);
        }));

        if (!snapshot.isDone) return Container();

        return listData.when(
            success: (data) => RefreshIndicator(
                child: data.isNotEmpty
                    ? Container(
                        height: double.infinity,
                        child: ListView.builder(
                            itemCount: data.length,
                            shrinkWrap: true,
                            itemBuilder: (_, index) {
                              return WithdrawItem(detail: data[index]);
                            }),
                      )
                    : const Center(
                        child: Text('Empty screen'),
                      ),
                onRefresh: viewModel.fetchUnWithdrawedRecord),
            failure: (error) => const Center(child: Text('Error screen')));
      }),
    );
  }
}

class WithdrawedScreen extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final date = useState(DateTime.now());
    return Column(
      children: [
        DateSelecter(
          onDateSelected: (value) {
            date.value = value;
            context
                .read(withdrawViewModelProvider)
                .fetchWithdrawedRecord(dateTime: date.value);
          },
        ),
        Expanded(
          child: ContainerWithLoading(
            child: HookBuilder(builder: (context) {
              final viewModel = useProvider(withdrawViewModelProvider);
              final listData = useProvider(withdrawViewModelProvider
                  .select((value) => value.withdrawedList));
              final snapshot = useFuture(useMemoized(() {
                return context.read(loadingStateProvider).whileLoading(() =>
                    viewModel.fetchWithdrawedRecord(dateTime: date.value));
              }));

              if (!snapshot.isDone) return Container();

              return listData.when(
                  success: (data) => RefreshIndicator(
                      child: data.isNotEmpty
                          ? Container(
                              height: double.infinity,
                              child: ListView.builder(
                                  itemCount: data.length,
                                  shrinkWrap: true,
                                  itemBuilder: (_, index) {
                                    return WithdrawedItem(detail: data[index]);
                                  }),
                            )
                          : const Center(
                              child: Text('Empty screen'),
                            ),
                      onRefresh: () => viewModel.fetchWithdrawedRecord(
                          dateTime: date.value)),
                  failure: (error) =>
                      const Center(child: Text('Error screen')));
            }),
          ),
        ),
      ],
    );
  }
}
