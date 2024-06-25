import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MyAccountScreen extends StatelessWidget {
  const MyAccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CupertinoColors.systemGroupedBackground,
      appBar: AppBar(
        title: const Text("My Account"),
        elevation: 0,
        backgroundColor: CupertinoColors.systemGroupedBackground,
        surfaceTintColor: Colors.transparent,
        titleTextStyle: Theme.of(context)
            .textTheme
            .headlineLarge!
            .copyWith(fontWeight: FontWeight.bold),
        centerTitle: false,
      ),
      body: ListView(
        children: [
          CupertinoListSection.insetGrouped(
            children: const [
              CupertinoListTile(
                title: Text("Adwait Patil"),
                subtitle: Text("12785452724"),
                leading: Icon(CupertinoIcons.person_crop_circle),
                padding: EdgeInsets.symmetric(vertical: 16, horizontal: 24),
              ),
            ],
          ),
          CupertinoListSection.insetGrouped(
            children: [
              Stack(
                children: [
                  CupertinoListTile(
                    title: Text(
                      "\u{20B9}0.0",
                      style: Theme.of(context)
                          .textTheme
                          .headlineMedium!
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                    subtitle: const Text("Wallet balance"),
                    padding: const EdgeInsets.symmetric(
                        vertical: 16, horizontal: 24),
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
                        )
                      ),
                    ),
                  ),
                  Positioned(
                    right: 24+8,
                    top: 28,
                    child: Container(
                      width: 24,
                      height: 24,
                      decoration: const BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.all(Radius.circular(40))
                      ),
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
          ),
          CupertinoListSection.insetGrouped(
            children: const [
              CupertinoListTile(
                leading: Icon(CupertinoIcons.lock_shield),
                title: Text("Account Settings"),
                trailing: CupertinoListTileChevron(),
              ),
              CupertinoListTile(
                leading: Icon(CupertinoIcons.creditcard),
                title: Text("Saved Cards"),
                trailing: CupertinoListTileChevron(),
              ),
              CupertinoListTile(
                leading: Icon(CupertinoIcons.info_circle),
                title: Text("About"),
                trailing: CupertinoListTileChevron(),
              ),
            ],
          ),
          CupertinoListSection.insetGrouped(
            children: const [
              CupertinoListTile(
                title:
                    Text("Logout", style: TextStyle(color: Colors.redAccent)),
                trailing: Icon(CupertinoIcons.power),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
