import 'package:flutter/material.dart';

/// Item of home page
class HomeItem extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback clickListener;

  const HomeItem({Key key, this.title, this.icon, this.clickListener})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration:
            BoxDecoration(color: Theme.of(context).cardColor, boxShadow: [
          BoxShadow(
            color: Theme.of(context).shadowColor,
            offset: const Offset(2, 2),
            blurRadius: 10,
          )
        ]),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
              onTap: clickListener,
              borderRadius: BorderRadius.circular(4.0),
              child: Container(
                  width: 200,
                  height: 150,
                  child: Container(
                      child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                              decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Theme.of(context).dividerColor,
                                    width: 0.5,
                                  ),
                                  borderRadius: BorderRadius.circular(48.0)),
                              child: Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Center(child: Icon(icon, size: 48.0)),
                              ))
                        ],
                      ),
                      const SizedBox(height: 10.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            title,
                            style: Theme.of(context).textTheme.subtitle2,
                          )
                        ],
                      )
                    ],
                  )))),
        ));
  }
}
