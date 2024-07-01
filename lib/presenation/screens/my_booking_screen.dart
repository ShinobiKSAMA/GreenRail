import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:greenrail/core/extensions/context_extension.dart';

class MyBookingScreen extends StatelessWidget {
  const MyBookingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ValueNotifier<String> segment = ValueNotifier("Upcoming");
    return SafeArea(
      minimum: const EdgeInsets.symmetric(horizontal: 24),
      child: Scaffold(
        // backgroundColor: CupertinoColors.systemGroupedBackground,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Segment(segment: segment),
            const SizedBox(height: 12),
            Text(
              "Bookings",
              style: context.textTheme.headlineLarge!
                  .copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
          ],
        ),
      ),
    );
  }
}

class Segment extends StatelessWidget {
  const Segment({super.key, required this.segment});

  final ValueNotifier<String> segment;

  @override
  Widget build(BuildContext context) {
    final values = ["Upcoming", "Completed", "Cancelled"];
    return ValueListenableBuilder(
        valueListenable: segment,
        builder: (context, value, child) {
          return CupertinoSlidingSegmentedControl(
            groupValue: segment.value,
            children: {
              for (var e in values)
                e: Text(e, style: const TextStyle(fontSize: 14))
            },
            onValueChanged: (e) => segment.value = e!,
          );
        });
  }
}
