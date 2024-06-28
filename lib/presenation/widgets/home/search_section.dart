import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:greenrail/core/extensions/context_extension.dart';
import 'package:greenrail/presenation/widgets/common/shared_button.dart';
import 'package:greenrail/presenation/widgets/home/details_form_section.dart';
import 'package:greenrail/presenation/widgets/home/opt_in_tile.dart';

class SearchSection extends StatelessWidget {
  const SearchSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(24), bottomRight: Radius.circular(24)),
      ),
      child: Column(
        children: [
          Text(
            "Book Train Tickets",
            style: context.textTheme.headlineSmall!
                .copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),
          const DetailsFormSection(),
          const SizedBox(height: 12),
          const OptInTile(),
          const SizedBox(height: 12),
          const SharedButton(
              title: "Search Trains", icon: CupertinoIcons.search),
          const SizedBox(height: 12),
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(CupertinoIcons.train_style_two),
              SizedBox(width: 4),
              Text("Authorised IRCTC Partner"),
            ],
          ),
        ],
      ),
    );
  }
}
