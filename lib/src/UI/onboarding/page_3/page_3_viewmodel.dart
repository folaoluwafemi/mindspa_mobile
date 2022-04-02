import 'package:mindspa_mobile/src/app/app.locator.dart';
import 'package:mindspa_mobile/src/app/app.logger.dart';
import 'package:mindspa_mobile/src/app/app.router.dart';
import 'package:mindspa_mobile/src/services/local%20storage/local_storage_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../core/constant/app_local_storage_keys.dart';

class Page3ViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final _localStorageService = locator<LocalStorageService>();
  final _log = getLogger('Page3ViewModel');
  void navigateToLogin() {
    _localStorageService.saveToDisk(AppLocalStoragekeys.newUser, false);
    _log.i(_localStorageService.getFromDisk(AppLocalStoragekeys.newUser));
    _navigationService.navigateTo(Routes.loginView);
  }

  void navigateToSignUp() {
    _localStorageService.saveToDisk(AppLocalStoragekeys.newUser, false);
    _log.i(_localStorageService.getFromDisk(AppLocalStoragekeys.newUser));
    _navigationService.navigateTo(Routes.registerView);
  }
}
