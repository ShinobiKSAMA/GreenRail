import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:greenrail/core/extensions/context_extension.dart';

class WalletTile extends StatelessWidget {
  const WalletTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CupertinoListSection.insetGrouped(
      children: [
        Stack(
          children: [
            CupertinoListTile(
              title: Text(
                "\u{20B9}0.0",
                style: context.textTheme.headlineMedium!
                    .copyWith(fontWeight: FontWeight.bold),
              ),
              subtitle: const Text("Wallet balance"),
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
            ),
            Positioned(
              right: 24,
              top: 0,
              child: Container(
                width: 40,
                height: 64,
                decoration: const BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(40),
                      bottomRight: Radius.circular(40),
                    )),
              ),
            ),
            Positioned(
              right: 24 + 8,
              top: 28,
              child: Container(
                width: 24,
                height: 24,
                decoration: const BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.all(Radius.circular(40))),
              ),
            ),
            // const Positioned(
            //   right: 24,
            //   top: -10,
            //   child: Icon(
            //     CupertinoIcons.bookmark_fill,
            //     size: 72,
            //   ),
            // ),
          ],
        ),
      ],
    );
  }
}
