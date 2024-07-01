import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:greenrail/core/extensions/context_extension.dart';

class DetailsFormSection extends StatelessWidget {
  const DetailsFormSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
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
              const DetailsFormTile(
                title: "From Station",
                icon: CupertinoIcons.bus,
                value: "Panvel PNVL",
              ),
              const Divider(height: 1),
              const DetailsFormTile(
                icon: Icons.bus_alert,
                title: "To Station",
                value: "Pune Jn PUNE",
              ),
              const Divider(height: 1),
              DetailsFormTile(
                icon: CupertinoIcons.calendar,
                title: "Date of Journey",
                value: "27 Jun, Thu",
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
              onPressed: () {},
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
  });

  final String title;
  final IconData icon;
  final String value;
  final Widget? trail;

  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}
