import 'package:mindspa_mobile/src/app/app.locator.dart';
import 'package:mindspa_mobile/src/app/app.router.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class GetStartedViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();

  void navigateToLogin() => _navigationService.navigateTo(Routes.loginView);
  void navigateToSignUp() => _navigationService.navigateTo(Routes.registerView);
}
