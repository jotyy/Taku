import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../constants.dart';
import '../page/deposit/deposit_view_model.dart';

final itemCountProvider = Provider((_) => 1);

class DepositListItem extends StatelessWidget {
  final DepositItem item;

  const DepositListItem({Key key, this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

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
                    style: theme.textTheme.headline6,
                  ),
                  const Spacer(),
                  Text(
                    '\$${item.price * item.amount}',
                    style: theme.textTheme.subtitle1
                        .copyWith(color: theme.accentColor),
                  )
                ],
              ),
              const Gap(6.0),
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
              const ItemCounter()
            ],
          ),
        ),
      ),
    );
  }
}

class ItemCounter extends HookWidget {
  const ItemCounter({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final count = useProvider(itemCountProvider);
    return Row(
      children: [
        const Spacer(),
        RoundedIcon(
          child: Icon(
            Icons.remove,
            color: Theme.of(context).iconTheme.color.withAlpha(150),
          ),
          onPressed: () => context.read(itemCountProvider) - 1,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Text(
            '$count',
            style: Theme.of(context).textTheme.subtitle1,
          ),
        ),
        RoundedIcon(
          child: Icon(
            Icons.add,
            color: Theme.of(context).iconTheme.color.withAlpha(150),
          ),
          onPressed: () => context.read(itemCountProvider) - 1,
        ),
      ],
    );
  }
}

class RoundedIcon extends StatelessWidget {
  final Widget child;
  final VoidCallback onPressed;

  const RoundedIcon({
    Key key,
    this.child,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
          padding: const EdgeInsets.all(2.0),
          decoration: BoxDecoration(
            color: Colors.grey.withAlpha(20),
            borderRadius: const BorderRadius.all(Radius.circular(4.0)),
          ),
          child: Center(child: child)),
      onTap: onPressed,
    );
  }
}
