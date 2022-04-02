import 'package:flutter/material.dart';
import 'package:mindspa_mobile/src/UI/authentication/views/login_view.dart';

import 'package:stacked/stacked.dart';

import '../landing_page/landing_page_view.dart';
import '../onboarding/onboarding_view.dart';
import 'startup_viewmodel.dart';

class StartupView extends StatelessWidget {
  const StartupView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<StartupViewModel>.reactive(
      viewModelBuilder: () => StartupViewModel(),
      onModelReady: (model) => model.onInit(),
      builder: (
        BuildContext context,
        StartupViewModel model,
        Widget? child,
      ) {
        if (model.data != null) {
          return const LandingPageView();
        } else {
          return model.onInit() ? const OnboardingView() : const LoginView();
        }
      },
    );
  }
}
