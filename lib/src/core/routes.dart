import 'package:flutter/material.dart';
import 'package:mindspa_mobile/src/features/authentication/views/login_view.dart';
import 'package:mindspa_mobile/src/features/authentication/views/register_view.dart';
import 'package:mindspa_mobile/src/features/categories/views/exercise_view.dart';
import 'package:mindspa_mobile/src/features/categories/views/nutrition_view.dart';
import 'package:mindspa_mobile/src/features/categories/views/sleep_and_relaxation_view.dart';

import 'package:mindspa_mobile/src/features/home_wrapper/view/home_wrapper_view.dart';

import '../features/authentication/views/login_view.dart';
import '../../src/features/onboarding/onboarding_view.dart';

class Routes {
  static const onBoarding = '/';
  static const login = '/signIn';
  static const register = '/signUp';
  static const homeWrapperView = 'homePage';
  static const sleepAndRelaxaionView = 'sleepAndRelaxation';
  static const nutritionView = 'nutritionView';
  static const exerciseView = 'excerciseView';

  static Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case onBoarding:
        return MaterialPageRoute(builder: (_) => const OnboardingView());
      case login:
        return MaterialPageRoute(builder: (_) => const LoginView());
      case register:
        return MaterialPageRoute(builder: (_) => const RegisterView());
      case homeWrapperView:
        return MaterialPageRoute(builder: (_) => const HomeWrapperView());
      case sleepAndRelaxaionView:
        return MaterialPageRoute(
            builder: (_) => const SleepAndRelaxationView());
      case nutritionView:
        return MaterialPageRoute(builder: (_) => const NutritionView());
      case exerciseView:
        return MaterialPageRoute(builder: (_) => const ExerciseView());
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
