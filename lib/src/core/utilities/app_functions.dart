import 'package:flutter/material.dart';

class AppFunctions with ChangeNotifier {
  bool _obsurePassword = true;

  bool get obscurePassword => _obsurePassword;

  void toggleRevealPasswordButton() {
    _obsurePassword = !_obsurePassword;
    notifyListeners();
  }
}
