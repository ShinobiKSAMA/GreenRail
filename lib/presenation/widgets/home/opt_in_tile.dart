import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:greenrail/core/extensions/context_extension.dart';

class OptInTile extends StatelessWidget {
  const OptInTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      child: CheckboxListTile(
        shape: RoundedRectangleBorder(
            side: BorderSide(color: context.colorScheme.outline, width: 1),
            borderRadius: const BorderRadius.all(Radius.circular(12))),
        visualDensity: VisualDensity.compact,
        secondary: const Icon(CupertinoIcons.lock_shield_fill, size: 45),
        title: const Text("Opt-in for Free Cancellation"),
        subtitle: const Text(
          "\u{20B9}0 cancellation fee and Instant refund",
          overflow: TextOverflow.ellipsis,
        ),
        checkboxShape: const CircleBorder(),
        contentPadding: const EdgeInsets.symmetric(horizontal: 8),
        value: false,
        onChanged: (value) => null,
      ),
    );
  }
}
