import 'package:mindspa_mobile/src/app/app.locator.dart';
import 'package:mindspa_mobile/src/app/app.logger.dart';
import 'package:mindspa_mobile/src/app/app.router.dart';

import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../services/base/failure.dart';
import '../../../services/authentication_services.dart';
import '../../../services/snackbar_service.dart';
import '../../../services/user_service.dart';

class LoginViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final _snackbarService = locator<SnackbarServices>();
  final _authenticationService = locator<AuthenticationServices>();
  final log = getLogger('Login View Model');
  // final _userService = locator<Users>();

  bool _obsurePassword = true;

  navigateTOForgotPasswordScreen() {
    _navigationService.navigateTo(Routes.forgotPasswordView);
  }

  bool get obscurePassword => _obsurePassword;

  void toggleRevealPasswordButton() {
    _obsurePassword = !_obsurePassword;
    notifyListeners();
  }

  Future<void> loginInWithEmailAndPassword(
      {required String emailAddress, required String password}) async {
    setBusy(true);
    try {
      UserModel result = await _authenticationService.login(
          emailAddress: emailAddress, password: password);
      log.i(result.uid);
    } on Failure catch (ex) {
      _snackbarService.showErrorSnackBar(ex.message);
    } finally {
      setBusy(false);
    }
  }

  Future<void> loginUserWithGoogle() async {
    setBusy(true);
    try {
      UserModel result = await _authenticationService.loginWithGoogle();
      log.i(result.uid);
    } on Failure catch (ex) {
      _snackbarService.showErrorSnackBar(ex.message);
    } finally {
      setBusy(false);
    }
  }

  void navigateToRegister() {
    _navigationService.replaceWith(Routes.registerView);
  }
}
