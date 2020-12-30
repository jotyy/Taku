import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants.dart';
import '../../data/local/app_database.dart';

class DepositListItem extends StatelessWidget {
  final Deposit deposit;

  const DepositListItem({Key key, this.deposit}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 2, 10, 2),
      child: Card(
        child: InkWell(
          onTap: () =>
              Get.toNamed(Constants.pageDepositDetail, arguments: deposit),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Hero(
                  tag: "${deposit.id}",
                  child: const CircleAvatar(
                    child: Icon(Icons.ac_unit),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("${deposit.name}",
                        style: Theme.of(context).textTheme.subtitle1),
                    const SizedBox(height: 5.0),
                    Text("${deposit.description}",
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
