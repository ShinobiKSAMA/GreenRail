import 'package:flutter/material.dart';
import 'package:greenrail/presenation/widgets/home/home.dart';
import 'package:greenrail/presenation/widgets/home/more_section.dart';
import 'package:greenrail/presenation/widgets/home/search_section.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ListView(
          children: const [
            SearchSection(),
            SizedBox(height: 24),
            MoreSection(),
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
