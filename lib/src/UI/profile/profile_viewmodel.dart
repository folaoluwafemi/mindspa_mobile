import 'package:mindspa_mobile/src/app/app.locator.dart';
import 'package:mindspa_mobile/src/app/app.router.dart';
import 'package:mindspa_mobile/src/services/authentication_services.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class ProfileViewModel extends BaseViewModel {
  final _authenticationService = locator<AuthenticationServices>();
  final _navigationService = locator<NavigationService>();
  // final _navigationService = locator<NavigationService>();
  get currentUserdisplayname =>
      _authenticationService.loggedInUser!.displayName;
  get currentUserEmail => _authenticationService.loggedInUser!.email;
  get currentUser => _authenticationService.loggedInUser;

  // int _currentIndex = 0;
  // get currentIndex => _currentIndex;
  // void setIndex(int newIndex) {
  //   _currentIndex = newIndex;
  // }

  void goToSettings() {
    _navigationService.navigateTo(Routes.settingsView);
  }
}
