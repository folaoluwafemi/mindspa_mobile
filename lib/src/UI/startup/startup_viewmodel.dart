import 'package:mindspa_mobile/src/app/app.locator.dart';
import 'package:stacked/stacked.dart';

import '../../services/authentication_services.dart';

class StartupViewModel extends StreamViewModel {
  final _authenticationService = locator<AuthenticationServices>();

  @override
  Stream get stream => _authenticationService.user;
}
