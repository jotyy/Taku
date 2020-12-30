import 'package:flutter/material.dart';

import '../component/bar_chart_sample.dart';
import '../component/pie_chart_sample.dart';

class StatisticPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text("数据统计", style: Theme.of(context).textTheme.headline1),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            TimeSelector(),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: BarChartSample1(),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: PieChartSample1(),
            )
          ],
        ),
      ),
    );
  }
}

class TimeSelector extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          IconButton(
            icon: const Icon(
              Icons.chevron_left,
              color: Colors.white60,
            ),
            onPressed: () {},
          ),
          Text(
            "2020-12-20",
            style: Theme.of(context)
                .textTheme
                .subtitle1
                .copyWith(color: Colors.white70),
          ),
          IconButton(
            icon: const Icon(
              Icons.chevron_right,
              color: Colors.white60,
            ),
            onPressed: () {},
          )
        ],
      ),
    );
  }
}
