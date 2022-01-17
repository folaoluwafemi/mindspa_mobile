import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/utilities/base_change_notifier.dart';
import '../../../repositories/authentication_repository.dart';
import '../../../services/snackbar_service.dart';

class LogoutNotifier extends BaseChangeNotifier {
  Future<void> signOut(
    BuildContext context,
  ) async {
    try {
      await AuthenticationRepository().logout();
      Navigator.pop(context);
    } catch (ex) {
      context.read<SnackbarService>().showErrorSnackBar(ex.toString());
    }
  }
}
