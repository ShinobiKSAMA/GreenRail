import 'dart:math';
import 'package:flutter/material.dart';
import 'package:greenrail/core/extensions/context_extension.dart';
import 'package:greenrail/core/utils/date_utils.dart';

import 'package:intl/intl.dart';

class DatePills extends StatelessWidget {
  const DatePills({
    super.key,
    required this.selected,
    required this.onSelected,
  });

  final int selected;
  final Function(int) onSelected;

  @override
  Widget build(BuildContext context) {
    final List<DateTime> dates = DateMethods.generateDatePills;

    return Container(
      margin: const EdgeInsets.only(bottom: 2),
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(
            width: 0.5,
            color: context.colorScheme.outlineVariant,
          ),
        ),
      ),
      height: 48,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Transform.rotate(
            angle: -pi / 2,
            child: const Text("JUL"),
          ),
          Expanded(
            child: ListView.separated(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: dates.length,
              itemBuilder: (_, i) => ChoiceChip(
                label: Text(DateFormat('dd E').format(dates[i])),
                selected: i == selected,
                visualDensity: VisualDensity.compact,
                onSelected: (value) => onSelected(i),
                selectedColor: context.colorScheme.primaryContainer,
                showCheckmark: false,
              ),
              separatorBuilder: (_, __) => const SizedBox(width: 4),
            ),
          )
        ],
      ),
    );
  }
}
