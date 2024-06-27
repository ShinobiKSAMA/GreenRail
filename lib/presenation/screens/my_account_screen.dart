import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:greenrail/core/extensions/context_extension.dart';
import 'package:greenrail/presenation/widgets/account/account.dart';

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
        titleTextStyle: context.textTheme.headlineLarge!
            .copyWith(fontWeight: FontWeight.bold),
        centerTitle: false,
      ),
      body: ListView(
        children: const [
          ProfileTile(),
          WalletTile(),
          SettingSection(),
          LogoutTile(),
        ],
      ),
    );
  }
}
