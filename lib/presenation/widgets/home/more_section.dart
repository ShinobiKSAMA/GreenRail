import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MoreSection extends StatelessWidget {
  const MoreSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            "Do more with greenRail",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8),
          Row(
            children: [
              MoreTile(
                title: "PNR Status",
                icon: CupertinoIcons.tickets,
              ),
              SizedBox(width: 8),
              MoreTile(
                title: "Where is my Train?",
                icon: CupertinoIcons.train_style_one,
              ),
              SizedBox(width: 8),
              MoreTile(
                title: "Train Schedule",
                icon: CupertinoIcons.calendar_badge_plus,
              ),
              SizedBox(width: 8),
              MoreTile(
                title: "Coach Position",
                icon: Icons.pin_drop_rounded,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class MoreTile extends StatelessWidget {
  const MoreTile({
    super.key,
    required this.icon,
    required this.title,
  });

  final IconData icon;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(12)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(icon),
            const SizedBox(height: 4),
            Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
    );
  }
}
