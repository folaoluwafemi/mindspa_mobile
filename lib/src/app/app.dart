import 'package:mindspa_mobile/src/UI/articles/articles_view.dart';
import 'package:mindspa_mobile/src/UI/authentication/views/forgot_password_view.dart';

import 'package:mindspa_mobile/src/UI/landing_page/landing_page_view.dart';
import 'package:mindspa_mobile/src/UI/settings/settings_view.dart';
import 'package:mindspa_mobile/src/UI/startup/startup_view.dart';
import 'package:mindspa_mobile/src/services/Authentication/firebase_auth_service.dart';
import 'package:mindspa_mobile/src/services/local%20storage/local_storage_service.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';

import '../UI/authentication/views/login_view.dart';
import '../UI/authentication/views/register_view.dart';
import '../UI/exercise/exercise_view.dart';
import '../UI/nutrition/nutrition_view.dart';
import '../UI/onboarding/onboarding_view.dart';
import '../UI/sleepandrelaxation/sleep_and_relaxation_view.dart';
import '../services/Authentication/auth_service.dart';
import '../services/snackbar_services.dart';

@StackedApp(
  routes: [
    MaterialRoute(page: OnboardingView),
    MaterialRoute(page: LoginView),
    MaterialRoute(page: RegisterView),
    MaterialRoute(page: LandingPageView),
    MaterialRoute(page: SleepAndRelaxationView),
    MaterialRoute(page: NutritionView),
    MaterialRoute(page: ExerciseView),
    MaterialRoute(page: ForgotPasswordView),
    MaterialRoute(page: SettingsView),
    MaterialRoute(page: StartupView, initial: true),
    MaterialRoute(page: ArticlesView),
  ],
  dependencies: [
    Presolve(
      classType: LocalStorageService,
      presolveUsing: LocalStorageService.getInstance,
    ),
    LazySingleton(classType: NavigationService),
    LazySingleton(classType: SnackbarServices),
    LazySingleton(classType: FirebaseAuthService, asType: AuthService),
  ],
  logger: StackedLogger(),
)
class AppSetup {
  /// Serves no purpose other than to use the [@StackedApp] annotation
}
