import 'package:mindspa_mobile/src/app/app.locator.dart';
import 'package:mindspa_mobile/src/app/app.router.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../services/base/failure.dart';
import '../../../services/authentication_services.dart';
import '../../../services/snackbar_service.dart';

class LoginViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final _snackbarService = locator<SnackbarServices>();
  final _authenticationService = locator<AuthenticationServices>();

  bool _obsurePassword = true;

  navigateTOForgotPasswordScreen() {
    _navigationService.navigateTo(Routes.forgotPasswordView);
  }

  bool get obscurePassword => _obsurePassword;

  void toggleRevealPasswordButton() {
    _obsurePassword = !_obsurePassword;
    notifyListeners();
  }

  Future<void> loginUser({
    required String emailAddress,
    required String password,
  }) async {
    setBusy(true);
    try {
      await _authenticationService.login(
        emailAddress: emailAddress.trim(),
        password: password,
      );
      if (_authenticationService.loggedInUser?.emailVerified == false) {
        _navigationService.replaceWith(
          Routes.verifyEmailView,
        );
      } else {
        _navigationService.replaceWith(Routes.bottomNavigationView);
      }
    } on Failure catch (ex) {
      _snackbarService.showErrorSnackBar(ex.message);
    }
    setBusy(false);
  }

  Future<void> loginUserWithGoogle() async {
    try {
      final user = await _authenticationService.loginWithGoogle();

      if (user != null) {
        _navigationService.replaceWith(Routes.bottomNavigationView);
      } else {
        _snackbarService.showErrorSnackBar('No email selected');
      }
    } on Failure catch (ex) {
      _snackbarService.showErrorSnackBar(ex.message);
    }
  }

  void navigateToRegister() {
    _navigationService.replaceWith(Routes.registerView);
  }
}
