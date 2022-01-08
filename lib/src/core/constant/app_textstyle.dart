import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextStyle {
  /// This class holds all the App styles
  /// Its also has a private constructor so that the class cannot be instantiated outside the class.
  /// You can only access the static fields.
  //TODO Remove this class and make use of the texttheme property in themeData
  AppTextStyle._();
  static TextStyle kBody1 =
      GoogleFonts.poppins(fontWeight: FontWeight.w500, fontSize: 20);
}
