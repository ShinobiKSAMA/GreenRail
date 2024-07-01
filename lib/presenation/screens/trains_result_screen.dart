import 'package:flutter/cupertino.dart';
import 'package:greenrail/presenation/widgets/common/opt_in_tile.dart';

class TrainsResultScreen extends StatefulWidget {
  const TrainsResultScreen({super.key});

  @override
  State<TrainsResultScreen> createState() => _TrainsResultScreenState();
}

class _TrainsResultScreenState extends State<TrainsResultScreen> {
  @override
  Widget build(BuildContext context) {
    return const CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text("PNVL to KTE"),
      ),
      child: SingleChildScrollView(
        // padding: EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            SizedBox(height: 76),
            OptInTile(),
          ],
        ),
      ),
    );
  }
}
