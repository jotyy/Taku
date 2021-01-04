import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/l10n.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../component/commodity_list_item.dart';
import '../../component/container_with_loading.dart';
import '../../component/search_input_box.dart';
import '../../loading_state_view_model.dart';
import 'commodity_view_model.dart';

class MyCommodityPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).cardColor,
      appBar: AppBar(
        title: Text(L10n.of(context).myCommodity),
      ),
      body: ContainerWithLoading(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SearchInputBox(onTextChange: (value) async {
              context
                  .read(commodityViewModelProvider)
                  .fetchCommoditiesByName(name: value);
            }),
            Expanded(
              child: HookBuilder(builder: (context) {
                final viewModel = context.read(commodityViewModelProvider);
                final commodities = useProvider(commodityViewModelProvider
                    .select((value) => value.commodities));

                return commodities.when(success: (data) {
                  if (data.isEmpty) {
                    return const Text('😭Empty result');
                  }
                  return RefreshIndicator(
                    child: ListView.builder(
                        itemCount: data.length,
                        scrollDirection: Axis.vertical,
                        itemBuilder: (_, index) {
                          return CommodityListItem(commodity: data[index]);
                        }),
                    onRefresh: () async => viewModel.fetchCommoditiesByName,
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
