import 'package:flutter/material.dart';
import 'package:greenrail/core/extensions/context_extension.dart';
import 'package:greenrail/core/extensions/date_extension.dart';
import 'package:greenrail/core/models/train_detail_model.dart';
import 'package:greenrail/core/utils/date_utils.dart';

class TrainTile extends StatelessWidget {
  const TrainTile({super.key, required this.details});

  final TrainDetailModel details;

  @override
  Widget build(BuildContext context) {
    final HaltsModel from = details.schedule.first;
    final HaltsModel to = details.schedule.last;
    return Container(
      color: context.colorScheme.surfaceContainerLowest,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TrainTileRow(
            lead: Text("${details.trainNo} | ${details.trainName}",
                style: const TextStyle(fontWeight: FontWeight.bold)),
            trail: const Text("Free Cancellation"),
          ),
          const TrainTileRow(
            lead: Text("All Days · View Schedule"),
            trail: Text("Wed, 03 Jul", style: TextStyle(fontSize: 12)),
          ),
          TrainTileRow(
            lead: Text(from.time.hhmm,
                style: const TextStyle(fontWeight: FontWeight.bold)),
            middle: Text(DateMethods.getDiff(from.time, to.time),
                style: const TextStyle(fontSize: 12)),
            trail: Text(to.time.hhmm,
                style: const TextStyle(fontWeight: FontWeight.bold)),
          ),
          TrainTileRow(
            lead: Text(from.station, style: const TextStyle(fontSize: 12)),
            trail: Text(to.station, style: const TextStyle(fontSize: 12)),
          ),
          SizedBox(
            height: 88,
            child: ListView.separated(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemBuilder: (_, i) => const CoachCard(),
              separatorBuilder: (_, __) => const SizedBox(width: 8),
              itemCount: 2,
            ),
          ),
        ],
      ),
    );
  }
}

class CoachCard extends StatelessWidget {
  const CoachCard({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 150,
      child: Card(
        color: context.colorScheme.secondaryContainer,
        shadowColor: context.colorScheme.secondary,
        child: const Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [Text("SL"), Text("Rs 650")],
              ),
              SizedBox(height: 8),
              Text("TQWL 29")
            ],
          ),
        ),
      ),
    );
  }
}

class TrainTileRow extends StatelessWidget {
  const TrainTileRow(
      {super.key, required this.lead, required this.trail, this.middle});

  final Widget lead;
  final Widget trail;
  final Widget? middle;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        lead,
        if (middle != null) ...[middle!],
        trail,
      ],
    );
  }
}
