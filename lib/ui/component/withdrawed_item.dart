import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../data/local/app_database.dart';
import '../../gen/assets.gen.dart';
import '../../util/date_util.dart';

class WithdrawedItem extends StatelessWidget {
  final Withdraw detail;

  const WithdrawedItem({Key key, this.detail}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
      child: Card(
        child: InkWell(
          onTap: () {},
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Assets.images.articlePlaceholder.image(
                height: 100,
                width: 100,
                fit: BoxFit.cover,
              ),
              const Gap(12.0),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${DateUtil.formatDate(detail.withdrawAt)}',
                        style: Theme.of(context).textTheme.caption,
                      ),
                      Text(detail.uuid),
                      const Gap(4.0),
                      Text('出库商品：${detail.name}'),
                      Text('出库数量：${detail.amount}'),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
