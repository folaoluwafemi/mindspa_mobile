import 'package:flutter/material.dart';


import '../core/constant/app_colors.dart';



class ReusableTextField extends StatelessWidget {
  const ReusableTextField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textAlign: TextAlign.center,
      cursorColor: AppColors.kAccentColor,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderSide: const BorderSide(
              color: AppColors.kAccentColor, width: 2),
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
              color: AppColors.kAccentColor, width: 2),
          borderRadius: BorderRadius.circular(10),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
              color: AppColors.kAccentColor, width: 1),
          borderRadius: BorderRadius.circular(9),
        ),
        disabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
              color: AppColors.kAccentColor, width: 2),
          borderRadius: BorderRadius.circular(9),
        ),
      ),
    );
  }
}
