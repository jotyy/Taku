import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../data/model/deposit_record.dart';
import '../../../component/deposit_detail_item.dart';

class DepositDetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final DepositRecord detail = Get.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "入库详情",
          style: Theme.of(context).textTheme.headline1,
        ),
      ),
      body: Column(
        children: [
          const DepositDetailItem(
            name: "名称",
            value: "Materila001",
          ),
          const DepositDetailItem(
            name: "编号",
            value: "CODE-129291089",
          ),
          const DepositDetailItem(
            name: "数量",
            value: "201",
          ),
          const DepositDetailItem(
            name: "入库时间",
            value: "2020.10.20 11:30:20",
          ),
          const DepositDetailItem(
            name: "入库人员",
            value: "Jotyy",
          ),
        ],
      ),
    );
  }
}
