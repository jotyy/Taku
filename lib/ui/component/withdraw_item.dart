import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../data/model/withdraw_commodity.dart';
import '../../gen/assets.gen.dart';
import '../page/withdraw/withdraw_view_model.dart';

class WithdrawItem extends StatelessWidget {
  final WithdrawCommodity detail;

  const WithdrawItem({Key key, this.detail}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 136,
      margin: const EdgeInsets.symmetric(horizontal: 6.0, vertical: 10.0),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(6.0))),
                child: Assets.images.articlePlaceholder.image(
                  height: 100,
                  width: 100,
                  fit: BoxFit.cover,
                ),
              ),
              const Gap(16.0),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      detail.name,
                      style: Theme.of(context)
                          .textTheme
                          .subtitle1
                          .copyWith(fontWeight: FontWeight.w600),
                    ),
                    Text(
                      detail.code,
                      style: Theme.of(context).textTheme.caption,
                    ),
                    const Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '剩余${detail.balance}件',
                          style: const TextStyle(fontSize: 14.0),
                        ),
                        FlatButton(
                            onPressed: () {
                              final controller =
                                  TextEditingController.fromValue(
                                      TextEditingValue(
                                          text: detail.balance.toString()));
                              showDialog(
                                context: context,
                                builder: (context) => AlertDialog(
                                  title: const Text('请输入出库数量'),
                                  content: TextField(
                                    textAlign: TextAlign.center,
                                    controller: controller,
                                    decoration: const InputDecoration(
                                      focusedBorder: OutlineInputBorder(),
                                      contentPadding: EdgeInsets.zero,
                                      border: OutlineInputBorder(),
                                    ),
                                  ),
                                  actions: [
                                    FlatButton(
                                      onPressed: () {
                                        context
                                            .read(withdrawViewModelProvider)
                                            .withdraw(
                                              int.parse(controller.text),
                                              detail.code,
                                              detail.name,
                                            );
                                        Get.back();
                                      },
                                      child: const Text('确定'),
                                    )
                                  ],
                                ),
                              );
                            },
                            child: const Text(
                              '出库',
                              style: TextStyle(fontSize: 14.0),
                            ))
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
