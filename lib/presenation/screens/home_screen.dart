import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      minimum: const EdgeInsets.symmetric(horizontal: 24),
      child: Scaffold(
        body: ListView(
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    children: [
                      Icon(CupertinoIcons.device_phone_portrait, size: 100),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Enjoying Swift-GreenRail?", style: TextStyle(fontWeight: FontWeight.bold)),
                            Text("Share your experiece with us and help spread the world!"),
                          ],
                        ),
                      ),
                    ],
                  ),
                  ButtonGroup(),
                ],
              ),
            ),
            const FAQSection(),
          ],
        ),
      ),
    );
  }
}

class ButtonGroup extends StatelessWidget {
  const ButtonGroup({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: OutlinedButton(
            onPressed: () {},
            style: OutlinedButton.styleFrom(
                padding: const EdgeInsets.symmetric(
                    vertical: 8, horizontal: 16),
                elevation: 0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12))),
            child: const Text("Needs Work"),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(
                    vertical: 8, horizontal: 16),
                elevation: 0,
                backgroundColor: Theme.of(context)
                    .colorScheme
                    .primaryContainer,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12))),
            child: const Text("Love It!"),
          ),
        ),
      ],
    );
  }
}

class FAQSection extends StatelessWidget {
  const FAQSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          "Why book with greenRail?",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
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
      tileColor:
          Theme.of(context).colorScheme.primaryContainer.withOpacity(0.5),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      trailing: const Icon(CupertinoIcons.square_arrow_up_on_square, size: 50),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
    );
  }
}
