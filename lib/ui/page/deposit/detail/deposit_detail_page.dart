import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../data/local/record/table/record.table.dart';
import '../../../../data/model/deposit_record.dart';
import '../../../../gen/assets.gen.dart';
import '../../../../util/date_util.dart';
import '../../../component/deposit_detail_item.dart';

class DepositDetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final DepositRecord detail = Get.arguments;
    return Scaffold(
      appBar: AppBar(
        title: const Text('入库详情'),
      ),
      body: Column(
        children: [
          Assets.images.articlePlaceholder.image(),
          DepositDetailItem(
            name: "入库编号",
            value: '${detail.record.uuid}',
          ),
          DepositDetailItem(
            name: "入库时间",
            value: '${DateUtil.formatDate(detail.record.depositAt)}',
          ),
          DepositDetailItem(
            name: "当前状态",
            value:
                detail.record.status == RecordStatus.deposited ? '未出库' : '已出库',
          ),
          DepositDetailItem(
            name: '商品名称',
            value: '${detail.commodity.name}',
          ),
          DepositDetailItem(
            name: '商品条码',
            value: '${detail.commodity.code}',
          ),
          DepositDetailItem(
            name: '商品数量',
            value: '${detail.record.amount}',
          ),
          DepositDetailItem(
            name: '商品总额',
            value: '${detail.record.amount * detail.commodity.price}',
          ),
        ],
      ),
    );
  }
}
