import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/l10n.dart';

class DepositPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(L10n.of(context).deposit,
            style: Theme.of(context).textTheme.headline1),
        actions: [
          IconButton(icon: const Icon(Icons.add_box), onPressed: () {})
        ],
      ),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 76.0,
              padding: const EdgeInsets.all(10.0),
              child: const TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(50.0))),
                    hintText: "请输入物品名称",
                    prefixIcon: Icon(Icons.search_rounded)),
              ),
            ),
            Expanded(child: _buildItemList(context))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.amber,
          onPressed: () {},
          child: const Icon(Icons.qr_code_scanner, color: Colors.black45)),
    );
  }

  Widget _buildItemList(BuildContext context) {
    return ListView.builder(
        itemCount: 20,
        itemBuilder: (context, index) {
          return Container(
              margin: const EdgeInsets.fromLTRB(12, 10, 12, 10),
              decoration: BoxDecoration(
                color: Colors.black38,
                borderRadius: const BorderRadius.all(Radius.circular(10.0)),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  children: [
                    const CircleAvatar(
                      child: Icon(Icons.ac_unit),
                    ),
                    Expanded(
                        child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("物品 $index",
                              style: Theme.of(context).textTheme.subtitle1),
                          const SizedBox(height: 5.0),
                          Text(
                            "这是一片雪花",
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
              ));
        });
  }
}
