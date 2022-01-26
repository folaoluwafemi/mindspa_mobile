import 'package:mindspa_mobile/src/app/app.locator.dart';
import 'package:mindspa_mobile/src/app/app.router.dart';
import 'package:mindspa_mobile/src/services/authentication_services.dart';
// import 'package:mindspa_mobile/src/services/navigation_services.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class HomeViewModel extends BaseViewModel {
  final _authenticationService = locator<AuthenticationServices>();
  final _navigationService = locator<NavigationService>();
  get currentUserdisplayname =>
      _authenticationService.loggedInUser!.displayName;
  get currentUser => _authenticationService.loggedInUser;
  void navigateToExercise() =>
      _navigationService.navigateTo(Routes.exerciseView);
  void navigateToSleepRelaxation() =>
      _navigationService.navigateTo(Routes.sleepAndRelaxationView);
  void navigateToNutrition() =>
      _navigationService.navigateTo(Routes.nutritionView);
}
