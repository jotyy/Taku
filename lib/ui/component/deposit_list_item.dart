import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

import '../../constants.dart';
import '../../data/local/app_database.dart';

class DepositListItem extends StatelessWidget {
  final Commodity commodity;

  const DepositListItem({Key key, this.commodity}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 2, 10, 2),
      child: Card(
        child: InkWell(
          onTap: () =>
              Get.toNamed(Constants.pageDepositDetail, arguments: commodity),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Hero(
                  tag: "${commodity.id}",
                  child: const CircleAvatar(
                    child: Icon(Icons.ac_unit),
                  ),
                ),
                const Gap(12),
                Expanded(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("${commodity.name}",
                        style: Theme.of(context).textTheme.subtitle1),
                    const Gap(5),
                    Text("${commodity.description}",
                        style: Theme.of(context).textTheme.caption)
                  ],
                ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
