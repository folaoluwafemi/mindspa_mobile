import 'package:mindspa_mobile/src/app/app.locator.dart';
import 'package:mindspa_mobile/src/app/app.router.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../services/authentication_services.dart';

class VerifyEmailViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final _authenticationService = locator<AuthenticationServices>();

  Future<void> navigateToLogin() async {
    await _authenticationService.logout();

    _navigationService.replaceWith(Routes.verifyEmailView);
  }
}
