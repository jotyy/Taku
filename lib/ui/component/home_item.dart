import 'package:flutter/material.dart';

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
              onTap: onTap,
              borderRadius: BorderRadius.circular(4.0),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Container(
                    child: Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: Theme.of(context).dividerColor,
                            width: 0.5,
                          ),
                          borderRadius: BorderRadius.circular(36.0)),
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Center(child: Icon(icon, size: 36.0)),
                      ),
                    ),
                    const SizedBox(
                      width: 20.0,
                    ),
                    Text(
                      title,
                      style: Theme.of(context).textTheme.headline6,
                    )
                  ],
                )),
              )),
        ));
  }
}
