import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class ItemCounter extends HookWidget {
  final int startCount;
  final Function(int) onChange;

  const ItemCounter({Key key, this.startCount, this.onChange})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final counter = useState(startCount);
    counter.addListener(() {
      onChange(counter.value);
    });
    return Row(
      children: [
        const Spacer(),
        RoundedIcon(
          child: Icon(
            Icons.remove,
            color: Theme.of(context).iconTheme.color.withAlpha(150),
          ),
          onPressed: () {
            if (counter.value > 1) {
              counter.value--;
            }
          },
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Text(
            '${counter.value}',
            style: Theme.of(context).textTheme.subtitle1,
          ),
        ),
        RoundedIcon(
          child: Icon(
            Icons.add,
            color: Theme.of(context).iconTheme.color.withAlpha(150),
          ),
          onPressed: () => counter.value++,
        ),
      ],
    );
  }
}

class RoundedIcon extends StatelessWidget {
  final Widget child;
  final VoidCallback onPressed;

  const RoundedIcon({
    Key key,
    this.child,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
          padding: const EdgeInsets.all(2.0),
          decoration: BoxDecoration(
            color: Colors.grey.withAlpha(20),
            borderRadius: const BorderRadius.all(Radius.circular(4.0)),
          ),
          child: Center(child: child)),
      onTap: onPressed,
    );
  }
}
