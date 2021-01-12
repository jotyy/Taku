import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/l10n.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../constants.dart';
import '../../../util/ext/async_snapshot.dart';
import '../../component/commodity_list_item.dart';
import '../../component/container_with_loading.dart';
import '../../component/search_input_box.dart';
import '../../loading_state_view_model.dart';
import 'commodity_view_model.dart';

enum MenuItem { add, import }

class MyCommodityPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).cardColor,
      appBar: AppBar(
        title: Text(L10n.of(context).myCommodity),
        actions: [
          PopupMenuButton<MenuItem>(
            onSelected: (value) {
              switch (value) {
                case MenuItem.add:
                  Get.toNamed(Constants.pageInputCommodity);
                  break;
                case MenuItem.import:
                  break;
              }
            },
            icon: const Icon(Icons.add),
            itemBuilder: (context) {
              return <PopupMenuEntry<MenuItem>>[
                PopupMenuItem<MenuItem>(
                  value: MenuItem.add,
                  child: Text(
                    '添加商品',
                    style: Theme.of(context).textTheme.bodyText2,
                  ),
                ),
                PopupMenuItem<MenuItem>(
                  value: MenuItem.import,
                  child: Text(
                    '批量导入',
                    style: Theme.of(context).textTheme.bodyText2,
                  ),
                ),
              ];
            },
          )
        ],
      ),
      body: ContainerWithLoading(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SearchInputBox(
                onTextChange: (value) => context
                    .read(commodityViewModelProvider)
                    .fetchCommoditiesByName(name: value)),
            Expanded(
              child: HookBuilder(builder: (context) {
                final viewModel = context.read(commodityViewModelProvider);
                final commodities = useProvider(commodityViewModelProvider
                    .select((value) => value.commodities));
                final snapshot = useFuture(useMemoized(() {
                  return context
                      .read(loadingStateProvider)
                      .whileLoading(viewModel.fetchCommoditiesByName);
                }));

                if (!snapshot.isDone) return Container();

                return commodities.when(success: (data) {
                  if (data.isEmpty) {
                    return const Text('😭Empty result');
                  }
                  return RefreshIndicator(
                    child: Column(
                      children: [
                        Row(
                          children: [
                            const Gap(20),
                            Text('共${data.length}件商品'),
                          ],
                        ),
                        ListView.builder(
                            itemCount: data.length,
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            itemBuilder: (_, index) {
                              return Dismissible(
                                  key: ValueKey(data[index].id),
                                  direction: DismissDirection.endToStart,
                                  child:
                                      CommodityListItem(commodity: data[index]),
                                  background: Container(
                                    color: Colors.red,
                                    child: Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: ListTile(
                                        tileColor: Colors.red,
                                        trailing: Icon(
                                          Icons.delete,
                                          color: Theme.of(context)
                                              .primaryIconTheme
                                              .color,
                                        ),
                                      ),
                                    ),
                                  ),
                                  onDismissed: (direction) {
                                    context
                                        .read(commodityViewModelProvider)
                                        .removeCommodity(data[index].id);
                                  });
                            }),
                      ],
                    ),
                    onRefresh: viewModel.fetchCommoditiesByName,
                  );
                }, failure: (e) {
                  return Text('Error: $e');
                });
              }),
            ),
          ],
        ),
      ),
    );
  }
}
