import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:greenrail/core/extensions/context_extension.dart';
import 'package:greenrail/core/models/station_model.dart';
import 'package:greenrail/core/models/train_detail_model.dart';
import 'package:greenrail/presenation/widgets/common/common.dart'
    show OptInTile;
import 'package:greenrail/presenation/widgets/train_results/train_results.dart';

class TrainsResultScreen extends StatefulWidget {
  const TrainsResultScreen({
    super.key,
    required this.from,
    required this.to,
  });

  final StationModel from;
  final StationModel to;

  @override
  State<TrainsResultScreen> createState() => _TrainsResultScreenState();
}

class _TrainsResultScreenState extends State<TrainsResultScreen> {
  int selected = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CupertinoColors.systemGroupedBackground,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            centerTitle: true,
            title: Column(
              children: [
                Text("${widget.from.code} to ${widget.to.code}",
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 14)),
                const Text("10 trains found", style: TextStyle(fontSize: 14)),
              ],
            ),
            elevation: 0,
            backgroundColor: context.colorScheme.surfaceContainerLowest,
            forceElevated: false,
            scrolledUnderElevation: 0,
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(48),
              child: DatePills(
                selected: selected,
                onSelected: (value) => setState(() => selected = value),
              ),
            ),
          ),
          const SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                OptInTile(rounded: false),
                SizedBox(height: 4),
                QuotaSection(),
                SizedBox(height: 4),
              ],
            ),
          ),
          SliverList.separated(
            itemBuilder: (context, index) => TrainTile(
              details: TrainDetailModel(
                trainNo: 22177,
                trainName: "Mahanagari Exp",
                schedule: [
                  HaltsModel(
                    time: DateTime(2024, 7, 2, 12, 10),
                    station: "C Shivaji Mah T(CSMT)",
                  ),
                  HaltsModel(
                    time: DateTime(2024, 7, 3, 17, 5),
                    station: "Katni(KTE)",
                  ),
                ],
              ),
            ),
            separatorBuilder: (context, index) => const SizedBox(height: 4),
            itemCount: 4,
          ),
        ],
      ),
    );
  }
}
