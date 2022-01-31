import 'package:mindspa_mobile/src/app/app.locator.dart';
import 'package:mindspa_mobile/src/app/app.router.dart';
import 'package:mindspa_mobile/src/services/base/failure.dart';
import 'package:mindspa_mobile/src/services/snackbar_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../services/authentication_services.dart';

class VerifyEmailViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final _authenticationService = locator<AuthenticationServices>();
  final _snackbarService = locator<SnackbarServices>();
  get currentUserdisplayname =>
      _authenticationService.loggedInUser?.displayName;
  get currentUserEmail => _authenticationService.loggedInUser?.email;

  Future<void> checkVerification() async {
    setBusy(true);

    try {
      await _authenticationService.loggedInUser?.reload();
      final bool? isVerified =
          _authenticationService.loggedInUser?.emailVerified;

      if (isVerified!) {
        _navigationService.replaceWith(Routes.bottomNavigationView);
      } else {
        _snackbarService.showErrorSnackBar('Unable to verify email');
      }
    } on Failure catch (ex) {
      _snackbarService.showErrorSnackBar(ex.message);
    } catch (ex) {
      _snackbarService.showErrorSnackBar(ex.toString());
    }
    setBusy(false);
  }

  navigateback() => _navigationService.back();
}
