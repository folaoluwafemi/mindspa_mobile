import 'package:mindspa_mobile/src/app/app.locator.dart';
import 'package:mindspa_mobile/src/app/app.router.dart';
import 'package:mindspa_mobile/src/services/Authentication/auth_service.dart';
import 'package:mindspa_mobile/src/services/base/failure.dart';
import 'package:mindspa_mobile/src/services/snackbar_services.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class SettingsViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final _authenticationService = locator<AuthService>();
  final _snackbarService = locator<SnackbarServices>();
  void goBack() {
    _navigationService.back();
  }

  Future<void> signOut() async {
    setBusy(true);
    try {
      await _authenticationService.logout();
      await _navigationService.clearStackAndShow(Routes.startupView);
    } on Failure catch (ex) {
      _snackbarService.showErrorSnackBar(ex.message);
    } finally {
      setBusy(false);
    }
  }
}
