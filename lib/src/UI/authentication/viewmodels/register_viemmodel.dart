import 'dart:async';

import 'package:mindspa_mobile/src/UI/authentication/model/user_params.dart';
import 'package:mindspa_mobile/src/app/app.locator.dart';
import 'package:mindspa_mobile/src/app/app.router.dart';
import 'package:mindspa_mobile/src/services/base/failure.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../services/Authentication/auth_service.dart';

import '../../../services/snackbar_services.dart';

import 'package:stacked/stacked.dart';

class RegisterViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final _snackbarService = locator<SnackbarServices>();
  final _authenticationService = locator<AuthService>();

  bool _obsurePassword = true;

  bool get obscurePassword => _obsurePassword;

  void toggleRevealPasswordButton() {
    _obsurePassword = !_obsurePassword;
    notifyListeners();
  }

  Future<void> registerUser({required UserParams userParams}) async {
    setBusy(true);
    try {
      await _authenticationService.register(params: userParams);
    } on Failure catch (ex) {
      _snackbarService.showErrorSnackBar(ex.message);
    }
    setBusy(false);
  }

  Future<void> loginUserWithGoogle() async {
    try {
      await _authenticationService.loginWithGoogle();
    } on Failure catch (ex) {
      _snackbarService.showErrorSnackBar(ex.message);
    }
  }

  /// Register was pushed on to the navigation stack, so here we are just
  /// ...popping it off the stack to return to login
  void navigateToLogin() => _navigationService.navigateTo(Routes.loginView);
}
