import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../app/app.locator.dart';
import '../../app/app.logger.dart';
import '../../app/app.router.dart';

class ForYouViewModel extends BaseViewModel {
  final log = getLogger('ForYouViewModel');
  final _navigationService = locator<NavigationService>();
  void goToArticleView() {
    _navigationService.navigateTo(Routes.articlesView);
  }
}
