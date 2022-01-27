import 'package:mindspa_mobile/src/app/app.locator.dart';
import 'package:mindspa_mobile/src/app/app.router.dart';
import 'package:mindspa_mobile/src/services/authentication_services.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class SettingsViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final _authenticationService = locator<AuthenticationServices>();
  void goBack() {
    _navigationService.back();
  }

  signOut() async {
    await _authenticationService.logout();
    _navigationService.replaceWith(Routes.loginView);
  }
}
