import 'package:flutter/material.dart';

class AppColors {
  /// This class holds all the App Colors
  /// Its also has a private constructor so that the class cannot be instantiated outside the class.
  /// You can only access the static fields.
  AppColors._();
  static const Color green = Color(0XFF53796A);
  static const Color lightGreen = Color(0XFF92AF96);
  static const lightGreenVariant = Color(0XFF425F53);
  static const warmBlue = Color(0XFF6F8078);
  static const white = Color(0xFFFFFFFF);
  static const grey = Color(0xFF999999);
  static const Color linksColor = Color(0XFF407afd);
  static const defaultShadow = BoxShadow(
    color: lightGreenVariant,
  );
}
