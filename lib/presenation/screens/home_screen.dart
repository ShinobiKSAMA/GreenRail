import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:greenrail/presenation/widgets/home/home.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: CupertinoColors.systemGroupedBackground,
        body: ListView(
          children: const [
            SearchSection(),
            SizedBox(height: 24),
            MoreSection(),
            SizedBox(height: 12),
            AnnoucementSection(),
            SizedBox(height: 12),
            FeedbackSection(),
            SizedBox(height: 12),
            FAQSection(),
          ],
        ),
      ),
    );
  }
}
