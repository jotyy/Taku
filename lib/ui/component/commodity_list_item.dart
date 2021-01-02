import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../data/local/app_database.dart';
import '../../gen/assets.gen.dart';

class CommodityListItem extends StatelessWidget {
  final Commodity commodity;

  const CommodityListItem({Key key, this.commodity}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 20.0),
      child: Container(
        child: Row(
          children: [
            Container(
              height: 36,
              width: 36,
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(8.0))),
              child: Assets.images.iconPlaceholder.image(),
            ),
            const Gap(16.0),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  commodity.name,
                  style: Theme.of(context).textTheme.subtitle1,
                ),
                Text(
                  commodity.description,
                  style: Theme.of(context).textTheme.caption,
                )
              ],
            ),
            const Spacer(),
            Text(
              "\$${commodity.price}",
              style: Theme.of(context).textTheme.headline6,
            ),
          ],
        ),
      ),
    );
  }
}
