import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:greenrail/presenation/widgets/common/shared_button.dart';

class FeedbackSection extends StatelessWidget {
  const FeedbackSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      margin: const EdgeInsets.symmetric(horizontal: 24),
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
                    Text("Enjoying greenRail?",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16)),
                    Text(
                        "Share your experiece with us and help spread the world!"),
                  ],
                ),
              ),
            ],
          ),
          ButtonGroup(),
        ],
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
            child: SharedButton(
                title: "Needs Work", outlined: true, onPressed: () {})),
        const SizedBox(width: 12),
        Expanded(
          child: SharedButton(
            title: "Love It!",
            icon: CupertinoIcons.heart_fill,
            onPressed: () {},
          ),
        ),
      ],
    );
  }
}
