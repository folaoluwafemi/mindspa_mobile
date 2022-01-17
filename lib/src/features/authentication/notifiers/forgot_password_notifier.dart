import 'package:flutter/widgets.dart';
import 'package:mindspa_mobile/src/repositories/authentication_repository.dart';
import 'package:provider/provider.dart';

import '../../../core/utilities/base_change_notifier.dart';
import '../../../repositories/authentication_repository.dart';
import '../../../services/base/failure.dart';
import '../../../services/navigation_service.dart';
import '../../../services/snackbar_service.dart';

class ForgotPasswordNotifier extends BaseChangeNotifier {
  Future<void> resetPassword(BuildContext context, String emailAddress) async {
    final navigationService =
        Provider.of<NavigationService>(context, listen: false);
    final snackbarService =
        Provider.of<SnackbarService>(context, listen: false);
    final authenticationRepository =
        Provider.of<AuthenticationRepository>(context, listen: false);

    try {
      await authenticationRepository.resetPassword(emailAddress.trim());

      navigationService.navigateBack();

      snackbarService.showSuccessSnackBar(
        'Instructions to reset your password has been sent to your email',
      );
    } on Failure catch (ex) {
      navigationService.navigateBack();

      snackbarService.showErrorSnackBar(ex.message);
    }
  }
}
