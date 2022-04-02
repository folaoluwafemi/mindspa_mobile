import 'package:mindspa_mobile/src/app/app.locator.dart';
import 'package:mindspa_mobile/src/app/app.logger.dart';
import 'package:mindspa_mobile/src/app/app.router.dart';
import 'package:mindspa_mobile/src/core/constant/app_images.dart';
import 'package:mindspa_mobile/src/core/constant/app_strings.dart';
import 'package:mindspa_mobile/src/services/Authentication/auth_service.dart';
// import 'package:mindspa_mobile/src/services/navigation_services.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../services/base/failure.dart';
import '../../services/snackbar_services.dart';

class HomeViewModel extends BaseViewModel {
  final log = getLogger('HomeViewModel');
  final _authenticationService = locator<AuthService>();
  final _navigationService = locator<NavigationService>();
  final _snackbarService = locator<SnackbarServices>();
  String? _displayName;
  get currentUserdisplayname => _displayName;

  void navigateToExercise() =>
      _navigationService.navigateTo(Routes.exerciseView);
  void navigateToSleepRelaxation() =>
      _navigationService.navigateTo(Routes.sleepAndRelaxationView);
  void navigateToNutrition() =>
      _navigationService.navigateTo(Routes.nutritionView);
  List<String> categoryText = [
    AppStrings.relaxation,
    AppStrings.nutritionGuide,
    AppStrings.exercise,
    AppStrings.sleep
  ];
  List<String> categoryImage = [
    AppImages.relaxation,
    AppImages.nutrition,
    AppImages.gym,
    AppImages.sleep
  ];
  Future<void> getUserDetails() async {
    setBusy(true);
    try {
      final result = await _authenticationService.getUserDetails();
      _displayName = result.displayName;

      log.e(result.uid);
    } on Failure catch (ex) {
      _snackbarService.showErrorSnackBar(ex.message);
    } finally {
      setBusy(false);
    }
  }
}
