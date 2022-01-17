import 'package:mindspa_mobile/src/services/snackbar_service.dart';

import '../../../core/routes.dart';
import '../../../core/utilities/base_change_notifier.dart';
import '../../../repositories/authentication_repository.dart';
import '../../../services/navigation_service.dart';

class VerifyEmailNotifier extends BaseChangeNotifier {
  final navigationService = NavigationService();
  final snackbarService = SnackbarService();
  final authenticationRepository = AuthenticationRepository();

  Future<void> navigateToLogin() async {
    await authenticationRepository.logout();

    navigationService.navigateOffNamed(Routes.login);
  }
}
