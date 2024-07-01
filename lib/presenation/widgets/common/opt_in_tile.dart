import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:greenrail/core/extensions/context_extension.dart';

class OptInTile extends StatelessWidget {
  const OptInTile({super.key, this.rounded = true});

  final bool rounded;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: CheckboxListTile(
        shape: rounded
            ? RoundedRectangleBorder(
                side: BorderSide(color: context.colorScheme.outline, width: 1),
                borderRadius: const BorderRadius.all(Radius.circular(12)),
              )
            : null,
        visualDensity: VisualDensity.compact,
        secondary: const Icon(CupertinoIcons.lock_shield_fill, size: 45),
        title: const Text("Opt-in for Free Cancellation"),
        tileColor: context.colorScheme.primaryContainer.withOpacity(0.5),
        subtitle: const Text(
          "\u{20B9}0 cancellation fee and Instant refund",
          overflow: TextOverflow.ellipsis,
        ),
        checkboxShape: const CircleBorder(),
        contentPadding: const EdgeInsets.symmetric(horizontal: 8),
        value: false,
        onChanged: (value) {},
      ),
    );
  }
}
