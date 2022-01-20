import 'package:firebase_auth/firebase_auth.dart';

import '../../../core/utilities/base_change_notifier.dart';
import '../../../repositories/authentication_repository.dart';

class StartupNotifier extends BaseChangeNotifier {
  final AuthenticationRepository authenticationRepository =
      AuthenticationRepository();
  User? get currentUser => authenticationRepository.loggedInUser;
}
