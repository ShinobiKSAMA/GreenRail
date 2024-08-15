import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:greenrail/core/extensions/context_extension.dart';
import 'package:greenrail/core/models/station_model.dart';
import 'package:greenrail/presenation/modals/search_station_modal.dart';
import 'package:greenrail/presenation/widgets/common/common.dart';

class SearchSection extends StatelessWidget {
  const SearchSection({super.key});

  @override
  Widget build(BuildContext context) {
    final ValueNotifier<StationModel> fromStation = ValueNotifier(stations[0]);
    final ValueNotifier<StationModel> toStation = ValueNotifier(stations[5]);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(24), bottomRight: Radius.circular(24)),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                "Book Train Tickets",
                style: context.textTheme.headlineSmall!
                    .copyWith(fontWeight: FontWeight.bold),
              ),
            ],
          ),
          const SizedBox(height: 12),
          DetailsFormSection(
            fromStation: fromStation,
            toStation: toStation,
          ),
          const SizedBox(height: 12),
          const OptInTile(),
          const SizedBox(height: 12),
          SharedButton(
            title: "Search Trains",
            icon: CupertinoIcons.search,
            onPressed: () => context.pushNamed(
              'Trains Result',
              extra: (fromStation.value, toStation.value),
            ),
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/irctc.png', width: 50),
              const Text("Authorised IRCTC Partner"),
            ],
          ),
        ],
      ),
    );
  }
}
