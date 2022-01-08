import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

import '../core/constant/app_colors.dart';

class ReuseableElevatedButton extends StatelessWidget {
  final String childText;
  final Function() onPressed;
  const ReuseableElevatedButton({
    Key? key,
    required this.childText,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          primary: AppColors.kAccentColor, shape: const StadiumBorder()),
      onPressed: onPressed,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 10),
        child: Text(
          childText,
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w500,
            fontSize: 25,
          ),
        ),
      ),
    );
  }
}
