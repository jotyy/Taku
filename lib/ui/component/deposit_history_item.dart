import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

import '../../constants.dart';
import '../../data/local/record/table/record.table.dart';
import '../../data/model/deposit_record.dart';
import '../../util/date_util.dart';

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
          onTap: () => Get.toNamed(
            Constants.pageDepositDetail,
            arguments: detail,
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                    _status(context, detail.record.status)
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

  Widget _status(BuildContext context, int status) {
    return status == RecordStatus.deposited
        ? Chip(
            label: const Text(
              '未出库',
              style: TextStyle(color: Colors.white, fontSize: 12.0),
            ),
            backgroundColor: Theme.of(context).accentColor.withAlpha(160),
          )
        : const Chip(label: Text('已出库'));
  }
}
