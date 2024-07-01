import 'dart:math';

import 'package:flutter/material.dart';
import 'package:greenrail/presenation/widgets/common/opt_in_tile.dart';

class TrainsResultScreen extends StatefulWidget {
  const TrainsResultScreen({super.key});

  @override
  State<TrainsResultScreen> createState() => _TrainsResultScreenState();
}

class _TrainsResultScreenState extends State<TrainsResultScreen> {
  int selected = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            centerTitle: true,
            title: const Text("PNVL to PUNE"),
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(48),
              child: SizedBox(
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
                        itemCount: 10,
                        itemBuilder: (_, i) => ChoiceChip(
                          label: Text("${i + 1} ${getWeekday(i)}"),
                          selected: i == selected,
                          onSelected: (value) => setState(() => selected = i),
                        ),
                        separatorBuilder: (_, __) => const SizedBox(width: 4),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          const SliverToBoxAdapter(
            child: OptInTile(rounded: false),
          ),
        ],
      ),
    );
  }

  String getWeekday(int i) {
    final int weekday = DateTime.now().copyWith(day: i + 1).weekday;
    return switch (weekday) {
      1 => "Mon",
      2 => "Tue",
      3 => "Wed",
      4 => "Thu",
      5 => "Fri",
      6 => "Sat",
      7 => "Sun",
      _ => ""
    };
  }
}
