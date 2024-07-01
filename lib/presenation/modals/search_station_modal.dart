import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:greenrail/core/extensions/context_extension.dart';
import 'package:greenrail/core/models/station_model.dart';

class SearchStationModal extends StatefulWidget {
  const SearchStationModal({super.key, required this.controller});

  final ValueNotifier<StationModel> controller;

  @override
  State<SearchStationModal> createState() => _SearchStationModalState();
}

class _SearchStationModalState extends State<SearchStationModal> {
  List<StationModel> filtered = [];

  @override
  void initState() {
    super.initState();

    filtered = stations;
  }

  void searchStation(String query) {
    setState(() => filtered = stations
        .where((e) =>
            e.name.contains(query) ||
            e.city.contains(query) ||
            e.code.contains(query))
        .toList());
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(12), topRight: Radius.circular(12)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppBar(
            backgroundColor: Colors.white,
            title: const Text('Station'),
            titleTextStyle: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: context.colorScheme.onSurface,
            ),
            centerTitle: true,
            leading: TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: const Text('Cancel')),
            leadingWidth: 80,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: CupertinoSearchTextField(
              placeholder: "City or Station",
              onChanged: searchStation,
            ),
          ),
          const Divider(height: 24),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                    child: Text(
                      "Popular Cities and Stations",
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: context.colorScheme.outline),
                    ),
                  ),
                  const Divider(height: 1, indent: 16),
                  ListView.separated(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: filtered.length,
                    separatorBuilder: (_, __) =>
                        const Divider(height: 1, indent: 16),
                    itemBuilder: (_, i) => StationTile(
                      station: filtered[i],
                      onTap: () {
                        widget.controller.value = filtered[i];
                        context.pop();
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class StationTile extends StatelessWidget {
  const StationTile({
    super.key,
    required this.station,
    required this.onTap,
  });

  final StationModel station;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      visualDensity: VisualDensity.compact,
      dense: true,
      onTap: onTap,
      title: Text(station.name,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
      subtitle: Text(station.city,
          style: const TextStyle(fontWeight: FontWeight.w600)),
      trailing: Text(
        station.code,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 16,
          color: context.colorScheme.primary,
        ),
      ),
    );
  }
}

List<StationModel> stations = const [
  StationModel(name: "Pune Jn", city: "Pune", code: "PUNE"),
  StationModel(name: "Pune Jn", city: "Pimpri Chinchwad", code: "PUNE"),
  StationModel(name: "Pune - All Stations", city: "Pune", code: "PUNE"),
  StationModel(name: "Panvel", city: "Panvel", code: "PNVL"),
  StationModel(name: "Omkareshwar Rd", city: "Omkareshwar Rd", code: "OM"),
  StationModel(name: "Khandwa", city: "Khandwa", code: "KNW"),
  StationModel(name: "Bandra Terminus", city: "Mumbai", code: "BDTS"),
  StationModel(name: "Nagpur - All Stations", city: "Nagpur", code: "NGP"),
  StationModel(name: "Thane", city: "Mumbai", code: "TNA"),
];
