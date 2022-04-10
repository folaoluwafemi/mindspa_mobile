import 'package:mindspa_mobile/src/app/app.locator.dart';
import 'package:mindspa_mobile/src/core/constant/app_local_storage_keys.dart';
import 'package:mindspa_mobile/src/services/Video/youtube_api.dart';
import 'package:mindspa_mobile/src/services/local%20storage/local_storage_service.dart';
import 'package:stacked/stacked.dart';

import '../../services/Authentication/auth_service.dart';

class StartupViewModel extends StreamViewModel {
  final _authenticationService = locator<AuthService>();
  final _localStorageService = locator<LocalStorageService>();

  onInit() {
    YoutubeApi().getVideos();
    return _localStorageService.getFromDisk(AppLocalStoragekeys.newUser) ??
        true;
  }

  @override
  Stream get stream => _authenticationService.user;
}
