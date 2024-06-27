import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:greenrail/core/extensions/context_extension.dart';

class FAQSection extends StatelessWidget {
  const FAQSection({
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
            "Why book with greenRail?",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8),
          FAQTile(title: "Authorised IRCTC partner"),
          SizedBox(height: 8),
          FAQTile(title: "Instant refunds on UPI payments"),
          SizedBox(height: 8),
          FAQTile(title: "Dedicated customer care on call"),
          SizedBox(height: 8),
          FAQTile(title: "Fastest confirmed booking experience"),
        ],
      ),
    );
  }
}

class FAQTile extends StatelessWidget {
  const FAQTile({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      tileColor: context.colorScheme.primaryContainer.withOpacity(0.5),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      trailing: const Icon(CupertinoIcons.square_arrow_up_on_square, size: 50),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
    );
  }
}
