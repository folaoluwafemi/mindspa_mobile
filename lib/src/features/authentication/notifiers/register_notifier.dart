import 'package:flutter/material.dart';
import 'package:mindspa_mobile/src/features/authentication/model/user_params.dart';
import 'package:provider/provider.dart';

import '../../../core/routes.dart';
import '../../../core/utilities/base_change_notifier.dart';
import '../../../repositories/authentication_repository.dart';
import '../../../services/base/failure.dart';
import '../../../services/navigation_service.dart';
import '../../../services/snackbar_service.dart';

class RegisterNotifier extends BaseChangeNotifier {
  RegisterNotifier();

  final navigationService = NavigationService();

  final authenticationRepository = AuthenticationRepository();
  bool _passwordVisible = true;

  bool get passwordVisible => _passwordVisible;

  void togglePasswordVisibility() {
    _passwordVisible = !_passwordVisible;
    notifyListeners();
  
  }

  Future<void> registerUser(BuildContext context,
      {required UserParams userParams}) async {
    try {
      await authenticationRepository.register(params: userParams);

      Navigator.pushNamed(context, Routes.login);
    } catch (ex) {
      context.read<SnackbarService>().showErrorSnackBar(ex.toString());
    }
  }

  void navigateToLogin() => navigationService.navigateBack();
}
