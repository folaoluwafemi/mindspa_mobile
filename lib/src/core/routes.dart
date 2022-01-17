import 'package:flutter/material.dart';
import 'package:mindspa_mobile/src/features/authentication/views/login_view.dart';
import 'package:mindspa_mobile/src/features/authentication/views/register_view.dart';
import 'package:mindspa_mobile/src/features/home_page/view/home_view.dart';

import '../features/authentication/views/login_view.dart';
import '../../src/features/onboarding/onboarding_view.dart';

class Routes {
  static const onBoarding = '/';
  static const login = 'signIn';
  static const register = 'signUp';
  static const homeView = 'homePage';

  static Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case onBoarding:
        return MaterialPageRoute(builder: (_) => const OnboardingView());
      case login:
        return MaterialPageRoute(builder: (_) => const LoginView());
      case register:
        return MaterialPageRoute(builder: (_) => const RegisterView());
      case homeView:
        return MaterialPageRoute(builder: (_) => HomeView());
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
