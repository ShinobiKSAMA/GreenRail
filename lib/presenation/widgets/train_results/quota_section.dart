import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:greenrail/core/extensions/context_extension.dart';

class QuotaSection extends StatelessWidget {
  const QuotaSection({
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:
          const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      color: context.colorScheme.surfaceContainerLowest,
      child: Row(
        children: [
          ActionChip(
            label: const Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text("Quota: General + Tatkal"),
                SizedBox(width: 8),
                Icon(CupertinoIcons.chevron_down, size: 16)
              ],
            ),
            avatar: const Icon(CupertinoIcons.ticket),
            backgroundColor: context.colorScheme.surfaceContainerLowest,
            visualDensity: VisualDensity.compact,
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
