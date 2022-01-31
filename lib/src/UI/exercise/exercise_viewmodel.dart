import 'package:mindspa_mobile/src/app/app.locator.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class ExerciseViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  void navigateback() => _navigationService.back();
}
