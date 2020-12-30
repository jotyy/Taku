import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants.dart';
import '../../data/local/app_database.dart';

class DepositListItem extends StatelessWidget {
  final Deposit deposit;

  const DepositListItem({Key key, this.deposit}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.fromLTRB(12, 10, 12, 10),
        decoration: const BoxDecoration(
          color: Colors.black38,
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
        ),
        child: InkWell(
          onTap: () => Get.toNamed(Constants.pageDepositDetail),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              children: [
                const CircleAvatar(
                  child: Icon(Icons.ac_unit),
                ),
                Expanded(
                    child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("${deposit.name}",
                          style: Theme.of(context).textTheme.subtitle1),
                      const SizedBox(height: 5.0),
                      Text(
                        "${deposit.description}",
                        style: Theme.of(context)
                            .textTheme
                            .caption
                            .copyWith(color: Colors.white60),
                      )
                    ],
                  ),
                ))
              ],
            ),
          ),
        ));
  }
}
