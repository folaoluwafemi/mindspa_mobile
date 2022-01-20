import 'package:flutter/material.dart';

class AppFunctions with ChangeNotifier {
  bool _obsurePassword = true;
  int _currentIndex = 0;

  bool get obscurePassword => _obsurePassword;
  int get currentIndex => _currentIndex;

  void toggleRevealPasswordButton() {
    _obsurePassword = !_obsurePassword;
    notifyListeners();
  }

  void setCurrentIndex(int newIndex) {
    _currentIndex = newIndex;
    notifyListeners();
  }
}
