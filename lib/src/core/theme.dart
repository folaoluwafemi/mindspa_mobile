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
              minimumSize: const Size.fromHeight(48),
              shape: const StadiumBorder()
              // RoundedRectangleBorder(
              //   borderRadius: BorderRadius.circular(24),
              // ),
              ),
        ),
      );

  static final ColorScheme _lightColorScheme =
      const ColorScheme.light().copyWith(
    primary: AppColors.lightGreen,
    secondary: AppColors.lightOrange,
    secondaryVariant: AppColors.lightGreen,
    onBackground: AppColors.dark,
    onSurface: AppColors.grey,
    surface: AppColors.linksColor,
  );

  static TextTheme _textTheme(ColorScheme colorScheme) => TextTheme(
        headline2: GoogleFonts.poppins(
          fontSize: 60,
          fontWeight: FontWeight.bold,
          color: colorScheme.onBackground,
        ),
        headline4: GoogleFonts.poppins(
          fontSize: 34,
          fontWeight: FontWeight.w500,
          color: colorScheme.onBackground,
        ),
        headline6: GoogleFonts.poppins(
          fontSize: 20,
          fontWeight: FontWeight.w400,
          color: colorScheme.onBackground,
        ),
        bodyText1: GoogleFonts.poppins(
          fontSize: 16,
          fontWeight: FontWeight.w400,
          color: colorScheme.onBackground,
        ),
        bodyText2: GoogleFonts.poppins(
          fontWeight: FontWeight.w400,
          color: colorScheme.onSurface,
        ),
        button: GoogleFonts.poppins(
          fontSize: 14,
          fontWeight: FontWeight.bold,
          color: colorScheme.onPrimary,
        ),
      );
}
