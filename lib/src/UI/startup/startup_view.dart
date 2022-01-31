import 'package:flutter/material.dart';
import 'package:mindspa_mobile/src/UI/bottom_navigation/view/bottom_navigation_view.dart';
import 'package:mindspa_mobile/src/UI/onboarding/onboarding_view.dart';
import 'package:mindspa_mobile/src/UI/startup/startup_viewmodel.dart';
import 'package:stacked/stacked.dart';

class StartupView extends StatelessWidget {
  const StartupView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<StartupViewModel>.reactive(
      viewModelBuilder: () => StartupViewModel(),
      builder: (
        BuildContext context,
        StartupViewModel model,
        Widget? child,
      ) =>
          model.currentUser
              ? const OnboardingView()
              : const BottomNavigationView(),
    );
  }
}
