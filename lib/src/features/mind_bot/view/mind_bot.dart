import 'package:flutter/material.dart';
import 'package:mindspa_mobile/src/widgets/statusbar.dart';

class MindBotView extends StatelessWidget {
  const MindBotView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Statusbar(
      child: Scaffold(
        body: Center(child: Text('Mind Bot')),
      ),
    );
  }
}
