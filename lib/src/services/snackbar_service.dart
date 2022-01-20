import 'package:flutter/material.dart';
import 'package:mindspa_mobile/src/core/constant/app_colors.dart';

class SnackbarService with ChangeNotifier {
  final scaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();

  ScaffoldFeatureController<SnackBar, SnackBarClosedReason> showSuccessSnackBar(
    String text,
  ) {
    return scaffoldMessengerKey.currentState!.showSnackBar(
      SnackBar(
        backgroundColor: AppColors.green,
        content: Text(text),
      ),
    );
  }

  ScaffoldFeatureController<SnackBar, SnackBarClosedReason> showErrorSnackBar(
    String text,
  ) {
    return scaffoldMessengerKey.currentState!.showSnackBar(
      SnackBar(
        backgroundColor: Colors.red,
        content: Text(text),
      ),
    );
  }
}
