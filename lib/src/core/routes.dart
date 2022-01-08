import 'package:flutter/material.dart';

import '../../src/features/sign_in/sign_in_view.dart';
import '../../src/features/onboarding/onboarding_view.dart';
import '../../src/features/sign_up/sign_up_view.dart';

class Routes {
  static const onBoarding = '/';
  static const signIn = 'signIn';
  static const signUp = 'signUp';

  static Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case onBoarding:
        return MaterialPageRoute(builder: (_) => const OnboardingView());
      case signIn:
        return MaterialPageRoute(builder: (_) => const SignInView());
      case signUp:
        return MaterialPageRoute(builder: (_) => const SignUpView());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('Invalid Route for ${settings.name}'),
            ),
          ),
        );
    }
  }
}
