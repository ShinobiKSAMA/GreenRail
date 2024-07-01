import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:greenrail/core/extensions/context_extension.dart';
import 'package:greenrail/core/models/station_model.dart';
import 'package:greenrail/presenation/modals/search_station_modal.dart';

class DetailsFormSection extends StatelessWidget {
  const DetailsFormSection({super.key});

  @override
  Widget build(BuildContext context) {
    void openSearch(ValueNotifier<StationModel> controller) {
      context.showModal(SearchStationModal(controller: controller),
          showDrag: false);
    }

    final ValueNotifier<StationModel> fromStation = ValueNotifier(stations[0]);
    final ValueNotifier<StationModel> toStation = ValueNotifier(stations[5]);

    void swapStations(StationModel from, StationModel to) {
      fromStation.value = to;
      toStation.value = from;
    }

    return Container(
      margin: EdgeInsets.zero,
      decoration: BoxDecoration(
        color: Colors.transparent,
        border: Border.all(color: context.colorScheme.outline, width: 1),
        borderRadius: const BorderRadius.all(Radius.circular(12)),
      ),
      child: Stack(
        children: [
          Column(
            children: [
              ValueListenableBuilder(
                  valueListenable: fromStation,
                  builder: (context, value, child) {
                    return DetailsFormTile(
                      title: "From Station",
                      icon: CupertinoIcons.bus,
                      value: '${value.name} ${value.code}',
                      onPressed: () => openSearch(fromStation),
                    );
                  }),
              const Divider(height: 1),
              ValueListenableBuilder(
                  valueListenable: toStation,
                  builder: (context, value, child) {
                    return DetailsFormTile(
                      icon: Icons.bus_alert,
                      title: "To Station",
                      value: '${value.name} ${value.code}',
                      onPressed: () => openSearch(toStation),
                    );
                  }),
              const Divider(height: 1),
              DetailsFormTile(
                icon: CupertinoIcons.calendar,
                title: "Date of Journey",
                value: "27 Jun, Thu",
                onPressed: () {},
                trail: ListView(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  children: const [
                    Chip(label: Text("Tomorrow"), side: BorderSide.none),
                    SizedBox(width: 8),
                    Chip(label: Text("Day After"), side: BorderSide.none),
                  ],
                ),
              ),
            ],
          ),
          Positioned(
            right: 4,
            top: 36,
            child: IconButton.filled(
              onPressed: () => swapStations(fromStation.value, toStation.value),
              icon: const Icon(CupertinoIcons.arrow_up_arrow_down),
              iconSize: 20,
            ),
          ),
        ],
      ),
    );
  }
}

class DetailsFormTile extends StatelessWidget {
  const DetailsFormTile({
    super.key,
    required this.title,
    required this.icon,
    required this.value,
    this.trail,
    required this.onPressed,
  });

  final String title;
  final IconData icon;
  final String value;
  final Widget? trail;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: 60,
        padding: const EdgeInsets.fromLTRB(16, 8, 0, 8),
        child: Row(
          children: [
            Icon(icon),
            const SizedBox(width: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: context.textTheme.labelSmall),
                Text(value,
                    style: context.textTheme.bodyLarge!
                        .copyWith(fontWeight: FontWeight.bold))
              ],
            ),
            const SizedBox(width: 16),
            if (trail != null) ...[Expanded(flex: 1, child: trail!)]
          ],
        ),
      ),
    );
  }
}
