import 'package:mindspa_mobile/src/app/app.locator.dart';
import 'package:mindspa_mobile/src/app/app.logger.dart';
import 'package:mindspa_mobile/src/app/app.router.dart';
import 'package:mindspa_mobile/src/services/Authentication/auth_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../services/base/failure.dart';
import '../../services/snackbar_services.dart';

class ProfileViewModel extends BaseViewModel {
  final log = getLogger('Profile View Model');
  final _authenticationService = locator<AuthService>();
  final _navigationService = locator<NavigationService>();
  final _snackbarService = locator<SnackbarServices>();

  String? _email;
  String? _displayName;
  get currentUserdisplayname => _displayName;
  get currentUserEmail => _email;

  Future<void> signOut() async {
    setBusy(true);
    try {
      await _authenticationService.logout();
    } on Failure catch (ex) {
      _snackbarService.showErrorSnackBar(ex.message);
    } finally {
      setBusy(false);
    }
  }

  void goToSettings() {
    _navigationService.navigateTo(Routes.settingsView);
  }

  Future<void> getUserDetails() async {
    setBusy(true);
    try {
      final result = await _authenticationService.getUserDetails();
      _displayName = result.displayName;
      _email = result.emailAddress;
      log.i(result.emailAddress);
      log.i(result.uid);
    } on Failure catch (ex) {
      _snackbarService.showErrorSnackBar(ex.message);
    } finally {
      setBusy(false);
    }
  }
}
