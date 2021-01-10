import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../util/date_util.dart';

class DateSelecter extends HookWidget {
  final Function(DateTime) onDateSelected;

  const DateSelecter({Key key, this.onDateSelected}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final selectedDate = useState(DateTime.now());
    useValueChanged(selectedDate.value, (_, __) {
      onDateSelected(selectedDate.value);
    });
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        IconButton(
          onPressed: () {
            selectedDate.value =
                selectedDate.value.subtract(const Duration(days: 1));
          },
          icon: const Icon(Icons.chevron_left),
          iconSize: 24.0,
        ),
        InkWell(
          onTap: () {
            showDatePicker(
              context: context,
              initialDate: selectedDate.value,
              firstDate: DateTime.now().subtract(const Duration(days: 90)),
              lastDate: DateTime.now(),
            ).then((value) {
              if (value != null) {
                selectedDate.value = value;
              }
            });
          },
          child: Text(
            '${DateUtil.formatDate(selectedDate.value, format: 'yyyy/MM/dd')}',
            style: const TextStyle(
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        IconButton(
          onPressed: () {
            if (!DateUtil.isSameDay(selectedDate.value, DateTime.now())) {
              selectedDate.value =
                  selectedDate.value.add(const Duration(days: 1));
            }
          },
          icon: const Icon(Icons.chevron_right),
          iconSize: 24.0,
        ),
      ],
    );
  }
}
