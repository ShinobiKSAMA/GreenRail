import 'package:flutter/material.dart';
import 'package:greenrail/core/extensions/context_extension.dart';

class SharedButton extends StatelessWidget {
  const SharedButton({
    super.key,
    required this.title,
    this.icon,
    this.outlined = false,
    required this.onPressed,
  });

  final String title;
  final IconData? icon;
  final bool outlined;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    var styleFrom = ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        elevation: 0,
        backgroundColor: outlined ? null : context.colorScheme.primary,
        foregroundColor: outlined
            ? context.colorScheme.onSurface
            : context.colorScheme.onPrimary,
        textStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)));

    return outlined
        ? OutlinedButton(
            onPressed: onPressed,
            style: styleFrom,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (icon != null) ...[
                  Icon(icon),
                  const SizedBox(width: 4),
                ],
                Text(title),
              ],
            ),
          )
        : ElevatedButton(
            onPressed: onPressed,
            style: styleFrom,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (icon != null) ...[
                  Icon(icon, size: 20, weight: 700),
                  const SizedBox(width: 4),
                ],
                Text(title),
              ],
            ),
          );
  }
}
