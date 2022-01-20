
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mindspa_mobile/src/features/home_wrapper/view/home_wrapper_view.dart';
import 'package:mindspa_mobile/src/features/onboarding/onboarding_view.dart';

class StartupView extends StatefulWidget {
  const StartupView({Key? key}) : super(key: key);

  @override
  State<StartupView> createState() => _StartupViewState();
}

class _StartupViewState extends State<StartupView> {
  final authChanges = FirebaseAuth.instance.authStateChanges();
  @override
  Widget build(
    BuildContext context,
  ) =>
      StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const OnboardingView();
          } else {
            return const HomeWrapperView();
          }
        },
      );
}
