import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../data/model/deposit_item.dart';
import '../page/deposit/deposit_view_model.dart';
import 'item_counter.dart';

class DepositListItem extends HookWidget {
  final DepositItem item;
  final int index;

  const DepositListItem({Key key, this.item, this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final count = useState(item.amount);

    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 2, 10, 2),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          child: Column(
            children: [
              Row(
                children: [
                  Text(
                    item.name,
                    style: theme.textTheme.subtitle1
                        .copyWith(fontWeight: FontWeight.w600),
                  ),
                  const Spacer(),
                  Text(
                    '\$${(item.price * count.value).toStringAsFixed(2)}',
                    style: theme.textTheme.subtitle1
                        .copyWith(color: theme.accentColor),
                  )
                ],
              ),
              const Gap(8.0),
              const Divider(height: 1),
              const Gap(6.0),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 6.0, horizontal: 4.0),
                child: Row(
                  children: [
                    const Text('Code'),
                    const Spacer(),
                    Text(item.code)
                  ],
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 6.0, horizontal: 4.0),
                child: Row(
                  children: [
                    const Text('Desc'),
                    const Spacer(),
                    Text(item.description)
                  ],
                ),
              ),
              const Gap(16.0),
              ItemCounter(
                  startCount: item.amount,
                  onChange: (value) {
                    count.value = value;
                    context
                        .read(depositViewModelProvider)
                        .editDepositItem(index, item.copyWith(amount: value));
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
