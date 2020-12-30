import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/l10n.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get/get.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:moor/moor.dart' as moor;

import '../../data/local/app_database.dart';
import '../component/container_with_loading.dart';
import '../component/deposit_list_item.dart';
import '../loading_state_view_model.dart';
import 'deposit_view_model.dart';

const mockItem = CommoditysCompanion(
  name: moor.Value("Item1"),
  code: moor.Value("CO-100020909091"),
  description: moor.Value("this is our first item"),
  depositBy: moor.Value("Jotyy"),
);

class DepositPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final viewModel = context.read(depositViewModelProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(L10n.of(context).deposit,
            style: Theme.of(context).textTheme.headline1),
        actions: [
          IconButton(icon: const Icon(Icons.add_box), onPressed: () {})
        ],
      ),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 76.0,
              padding: const EdgeInsets.all(10.0),
              child: const TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(50.0))),
                    hintText: "请输入物品名称",
                    prefixIcon: Icon(Icons.search_rounded)),
              ),
            ),
            Expanded(
              child: ContainerWithLoading(
                child: HookBuilder(builder: (context) {
                  final deposits = useProvider(depositViewModelProvider
                      .select((value) => value.deposits));
                  final snapshot = useFuture(useMemoized(() {
                    return context
                        .read(loadingStateProvider)
                        .whileLoading(viewModel.fetchDeposits);
                  }, [deposits.toString()]));

                  if (snapshot.isBlank) return Container();

                  return deposits.when(success: (data) {
                    if (data.isEmpty) {
                      return const Text('Empty screen');
                    }
                    return RefreshIndicator(
                      child: ListView.builder(
                          itemCount: data.length,
                          scrollDirection: Axis.vertical,
                          itemBuilder: (_, index) {
                            return DepositListItem(commodity: data[index]);
                          }),
                      onRefresh: () async => viewModel.fetchDeposits(),
                    );
                  }, failure: (e) {
                    return Text('Error: $e');
                  });
                }),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.amber,
          onPressed: () => viewModel.addDeposit(mockItem),
          child: const Icon(Icons.qr_code_scanner, color: Colors.black45)),
    );
  }
}
