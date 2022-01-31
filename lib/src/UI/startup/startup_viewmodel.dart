import 'package:mindspa_mobile/src/app/app.locator.dart';
import 'package:stacked/stacked.dart';

import '../../services/authentication_services.dart';

class StartupViewModel extends BaseViewModel {
  final _authenticationService = locator<AuthenticationServices>();
  bool get currentUser => _authenticationService.loggedInUser == null;
  bool? get newcurrentUser =>
      _authenticationService.loggedInUser?.emailVerified;
}
