import 'package:mindspa_mobile/src/app/app.locator.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../services/Authentication/auth_service.dart';
import '../../../services/base/failure.dart';
import '../../../services/snackbar_services.dart';

class ForgotPasswordViewModel extends BaseViewModel {
  final _authenticationService = locator<AuthService>();
  final _snackbarService = locator<SnackbarServices>();
  final _navigationService = locator<NavigationService>();
  Future<void> resetPassword(String emailAddress) async {
    setBusy(true);
    try {
      await _authenticationService.resetPassword(emailAddress.trim());

      _navigationService.back();

      _snackbarService.showSuccessSnackBar(
        'Instructions to reset your password has been sent to your email',
      );
    } on Failure catch (ex) {
      _navigationService.back();

      _snackbarService.showErrorSnackBar(ex.message);
    }
    setBusy(false);
  }
}
