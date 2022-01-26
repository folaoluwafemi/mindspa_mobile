import 'package:flutter/material.dart';
import 'package:mindspa_mobile/src/widgets/statusbar.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Statusbar(
      child: Scaffold(
        body: Center(child: Text('Profile data')),
      ),
    );
  }
}
