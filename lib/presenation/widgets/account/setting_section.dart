import 'package:flutter/cupertino.dart';

class SettingSection extends StatelessWidget {
  const SettingSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CupertinoListSection.insetGrouped(
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
    );
  }
}
