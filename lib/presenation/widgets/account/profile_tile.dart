import 'package:flutter/cupertino.dart';

class ProfileTile extends StatelessWidget {
  const ProfileTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CupertinoListSection.insetGrouped(
      children: const [
        CupertinoListTile(
          title: Text("Adwait Patil"),
          subtitle: Text("12785452724"),
          leading: Icon(CupertinoIcons.person_crop_circle),
          padding: EdgeInsets.symmetric(vertical: 16, horizontal: 24),
        ),
      ],
    );
  }
}
