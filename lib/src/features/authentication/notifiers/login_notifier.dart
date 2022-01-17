import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/routes.dart';
import '../../../core/utilities/base_change_notifier.dart';
import '../../../repositories/authentication_repository.dart';
import '../../../services/base/failure.dart';
import '../../../services/navigation_service.dart';
import '../../../services/snackbar_service.dart';

class LoginNotifier extends BaseChangeNotifier {
  final navigationService = NavigationService();
  final snackbarService = SnackbarService();
  final authenticationRepository = AuthenticationRepository();

  bool _passwordVisible = true;

  bool get passwordVisible => _passwordVisible;

  void togglePasswordVisibility() {
    _passwordVisible = !_passwordVisible;
    notifyListeners();
  }

  Future<void> loginUser(
    BuildContext context, {
    required String emailAddress,
    required String password,
  }) async {
    try {
      await authenticationRepository.login(
        emailAddress: emailAddress.trim(),
        password: password,
      );

      Navigator.pushNamed(context, Routes.homeView);
    } catch (ex) {
      context.read<SnackbarService>().showErrorSnackBar(ex.toString());
    }
  }

  Future<void> loginUserWithGoogle(BuildContext context) async {
    try {
      final user = await authenticationRepository.loginWithGoogle();

      if (user != null) {
        Navigator.pushReplacementNamed(context, Routes.homeView);
      } else {
        snackbarService.showErrorSnackBar('No email selected');
      }
    } catch (ex) {
      snackbarService.showErrorSnackBar(ex.toString());
    }
  }

  void navigateToRegister(BuildContext context) {
    Navigator.pushNamed(context, Routes.login);
  }
}
