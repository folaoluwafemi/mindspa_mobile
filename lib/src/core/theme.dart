// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mindspa_mobile/src/core/constant/app_colors.dart';

class AppTheme {
  AppTheme._();

  static ThemeData lightTheme = _themeData(_lightColorScheme);

  /// The app was designed in a light theme mode so, there's no dark theme data
  /// for now
  // static final _darkTheme = ThemeData();

  static _themeData(ColorScheme colorScheme) => ThemeData(
        colorScheme: colorScheme,
        textTheme: GoogleFonts.poppinsTextTheme(
          _textTheme(colorScheme),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            // minimumSize: const Size.fromHeight(48),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
      );

  static final ColorScheme _lightColorScheme =
      const ColorScheme.light().copyWith(
    primary: AppColors.green,
    onPrimary: AppColors.lightGreen,
    secondary: AppColors.lightGreenVariant,
    secondaryVariant: AppColors.grey,
    onSurface: AppColors.lightGreenVariant,
    surface: AppColors.linksColor,
    primaryVariant: AppColors.white,
    onSecondary: AppColors.warmBlue,
  );

  static TextTheme _textTheme(ColorScheme colorScheme) => TextTheme(
        headline1: GoogleFonts.poppins(
            fontSize: 24,
            fontWeight: FontWeight.w500,
            color: colorScheme.primaryVariant),
        headline2: GoogleFonts.poppins(
            fontSize: 18,
            fontWeight: FontWeight.w400,
            color: colorScheme.primaryVariant),
        headline3: GoogleFonts.poppins(
          fontSize: 16,
          fontWeight: FontWeight.w400,
          color: colorScheme.primaryVariant,
        ),
        headline4: GoogleFonts.poppins(
          fontSize: 14,
          fontWeight: FontWeight.w400,
          color: colorScheme.primaryVariant,
        ),
        headline5: GoogleFonts.poppins(
          fontSize: 12,
          color: colorScheme.primaryVariant,
        ),
        bodyText1: GoogleFonts.poppins(
          fontSize: 14,
          fontWeight: FontWeight.w400,
          color: colorScheme.onBackground,
        ),
        bodyText2: GoogleFonts.poppins(
          fontWeight: FontWeight.w400,
          color: colorScheme.secondaryVariant,
        ),
        button: GoogleFonts.poppins(
          fontSize: 14,
          fontWeight: FontWeight.bold,
          color: colorScheme.onPrimary,
        ),
      );
}
