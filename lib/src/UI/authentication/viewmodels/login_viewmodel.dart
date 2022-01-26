import 'package:flutter/material.dart';
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

  bool _passwordVisible = true;

  bool get passwordVisible => _passwordVisible;

  void togglePasswordVisibility() {
    _passwordVisible = !_passwordVisible;
    notifyListeners();
  }

  Future<void> loginUser({
    required String emailAddress,
    required String password,
  }) async {
    try {
      await _authenticationService.login(
        emailAddress: emailAddress.trim(),
        password: password,
      );

      _navigationService.replaceWith(Routes.bottomNavigationView);
    } on Failure catch (ex) {
      _snackbarService.showErrorSnackBar(ex.message);
    }
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

  void navigateToRegister(BuildContext context) {
    Navigator.pushNamed(context, Routes.registerView);
  }
}
