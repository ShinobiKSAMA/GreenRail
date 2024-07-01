import 'package:flutter/material.dart';

class AnnoucementSection extends StatelessWidget {
  const AnnoucementSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 24),
          child: Text(
            "Annoucements",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(
          height: 124,
          child: PageView(
            scrollDirection: Axis.horizontal,
            children: const [
              AnnoucementTile(color: Colors.pinkAccent),
              AnnoucementTile(color: Colors.orange),
              AnnoucementTile(color: Colors.indigo),
            ],
          ),
        )
      ],
    );
  }
}

class AnnoucementTile extends StatelessWidget {
  const AnnoucementTile({
    super.key,
    required this.color,
  });

  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: color.withOpacity(0.2),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(width: 1, color: color)
      ),
      child: Row(
        children: [
          const Expanded(
            child: Text(
              "Bookings open for festive season. Seats filling fast, Book now.",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
          IconButton.filled(
            onPressed: () {},
            icon: const Icon(Icons.arrow_forward),
            style: IconButton.styleFrom(backgroundColor: color),
          )
        ],
      ),
    );
  }
}
