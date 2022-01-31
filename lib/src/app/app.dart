import 'package:mindspa_mobile/src/UI/authentication/views/forgot_password_view.dart';
import 'package:mindspa_mobile/src/UI/authentication/views/verify_email_view.dart';
import 'package:mindspa_mobile/src/UI/get%20started/get_started_view.dart';
import 'package:mindspa_mobile/src/UI/settings/settings_view.dart';
import 'package:mindspa_mobile/src/UI/startup/startup_view.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';

import '../UI/authentication/views/login_view.dart';
import '../UI/authentication/views/register_view.dart';
import '../UI/bottom_navigation/view/bottom_navigation_view.dart';
import '../UI/exercise/exercise_view.dart';
import '../UI/nutrition/nutrition_view.dart';
import '../UI/onboarding/onboarding_view.dart';
import '../UI/sleepandrelaxation/sleep_and_relaxation_view.dart';
import '/src/services/authentication_services.dart';
import '/src/services/snackbar_service.dart';

@StackedApp(routes: [
  MaterialRoute(page: OnboardingView),
  MaterialRoute(page: LoginView),
  MaterialRoute(page: RegisterView),
  MaterialRoute(page: BottomNavigationView),
  MaterialRoute(page: SleepAndRelaxationView),
  MaterialRoute(page: NutritionView),
  MaterialRoute(page: ExerciseView),
  MaterialRoute(page: ForgotPasswordView),
  MaterialRoute(page: VerifyEmailView),
  MaterialRoute(page: SettingsView),
  MaterialRoute(page: GetStartedView),
  MaterialRoute(page: StartupView, initial: true)
], dependencies: [
  LazySingleton(classType: NavigationService),
  LazySingleton(classType: SnackbarServices),
  LazySingleton(classType: AuthenticationServices)
])
class AppSetup {
  //used to handle dependency injection
}
