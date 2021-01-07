import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

/// Item of home page
class HomeItem extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback onTap;

  const HomeItem({Key key, this.title, this.icon, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.fromLTRB(12, 20, 12, 20),
        decoration: BoxDecoration(
            color: Theme.of(context).cardColor,
            borderRadius: const BorderRadius.all(Radius.circular(4.0)),
            boxShadow: [
              BoxShadow(
                color: Theme.of(context).shadowColor,
                offset: const Offset(2, 2),
                blurRadius: 10,
              ),
            ]),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
              onTap: onTap,
              borderRadius: BorderRadius.circular(4.0),
              child: Container(
                  child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(12.0),
                    decoration: BoxDecoration(
                      color: Theme.of(context).accentColor.withAlpha(160),
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(4.0),
                          bottomLeft: Radius.circular(4.0)),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Center(
                          child: Icon(
                        icon,
                        size: 36.0,
                        color: Theme.of(context)
                            .primaryIconTheme
                            .color
                            .withAlpha(180),
                      )),
                    ),
                  ),
                  const Gap(30.0),
                  Text(
                    title,
                    style: Theme.of(context).textTheme.headline6,
                  )
                ],
              ))),
        ));
  }
}
