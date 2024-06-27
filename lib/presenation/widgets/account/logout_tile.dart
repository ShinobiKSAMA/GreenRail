import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LogoutTile extends StatelessWidget {
  const LogoutTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CupertinoListSection.insetGrouped(
      children: const [
        CupertinoListTile(
          title:
              Text("Logout", style: TextStyle(color: Colors.redAccent)),
          trailing: Icon(CupertinoIcons.power),
        ),
      ],
    );
  }
}
