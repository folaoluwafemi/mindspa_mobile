// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedRouterGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../UI/authentication/views/forgot_password_view.dart';
import '../UI/authentication/views/login_view.dart';
import '../UI/authentication/views/register_view.dart';
import '../UI/authentication/views/verify_email_view.dart';
import '../UI/bottom_navigation/view/bottom_navigation_view.dart';
import '../UI/exercise/exercise_view.dart';
import '../UI/get%20started/get_started_view.dart';
import '../UI/nutrition/nutrition_view.dart';
import '../UI/onboarding/onboarding_view.dart';
import '../UI/settings/settings_view.dart';
import '../UI/sleepandrelaxation/sleep_and_relaxation_view.dart';
import '../UI/startup/startup_view.dart';

class Routes {
  static const String onboardingView = '/onboarding-view';
  static const String loginView = '/login-view';
  static const String registerView = '/register-view';
  static const String bottomNavigationView = '/bottom-navigation-view';
  static const String sleepAndRelaxationView = '/sleep-and-relaxation-view';
  static const String nutritionView = '/nutrition-view';
  static const String exerciseView = '/exercise-view';
  static const String forgotPasswordView = '/forgot-password-view';
  static const String verifyEmailView = '/verify-email-view';
  static const String settingsView = '/settings-view';
  static const String getStartedView = '/get-started-view';
  static const String startupView = '/';
  static const all = <String>{
    onboardingView,
    loginView,
    registerView,
    bottomNavigationView,
    sleepAndRelaxationView,
    nutritionView,
    exerciseView,
    forgotPasswordView,
    verifyEmailView,
    settingsView,
    getStartedView,
    startupView,
  };
}

class StackedRouter extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(Routes.onboardingView, page: OnboardingView),
    RouteDef(Routes.loginView, page: LoginView),
    RouteDef(Routes.registerView, page: RegisterView),
    RouteDef(Routes.bottomNavigationView, page: BottomNavigationView),
    RouteDef(Routes.sleepAndRelaxationView, page: SleepAndRelaxationView),
    RouteDef(Routes.nutritionView, page: NutritionView),
    RouteDef(Routes.exerciseView, page: ExerciseView),
    RouteDef(Routes.forgotPasswordView, page: ForgotPasswordView),
    RouteDef(Routes.verifyEmailView, page: VerifyEmailView),
    RouteDef(Routes.settingsView, page: SettingsView),
    RouteDef(Routes.getStartedView, page: GetStartedView),
    RouteDef(Routes.startupView, page: StartupView),
  ];
  @override
  Map<Type, StackedRouteFactory> get pagesMap => _pagesMap;
  final _pagesMap = <Type, StackedRouteFactory>{
    OnboardingView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const OnboardingView(),
        settings: data,
      );
    },
    LoginView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const LoginView(),
        settings: data,
      );
    },
    RegisterView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const RegisterView(),
        settings: data,
      );
    },
    BottomNavigationView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const BottomNavigationView(),
        settings: data,
      );
    },
    SleepAndRelaxationView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const SleepAndRelaxationView(),
        settings: data,
      );
    },
    NutritionView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const NutritionView(),
        settings: data,
      );
    },
    ExerciseView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const ExerciseView(),
        settings: data,
      );
    },
    ForgotPasswordView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const ForgotPasswordView(),
        settings: data,
      );
    },
    VerifyEmailView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const VerifyEmailView(),
        settings: data,
      );
    },
    SettingsView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const SettingsView(),
        settings: data,
      );
    },
    GetStartedView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const GetStartedView(),
        settings: data,
      );
    },
    StartupView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const StartupView(),
        settings: data,
      );
    },
  };
}
