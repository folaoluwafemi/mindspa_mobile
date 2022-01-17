import 'package:flutter/material.dart';

import '../core/constant/app_colors.dart';

class ReusableTextField extends StatelessWidget {
  final TextInputAction? textInputAction;
  final FocusNode? focusNode;
  final TextEditingController? controller;
  final Function(String)? onSubmitted;
  final String? Function(String?)? validator;
  final Widget? icon;
  final bool obsureText;
  const ReusableTextField(
      {Key? key,
      this.textInputAction,
      this.focusNode,
      this.onSubmitted,
      this.validator,
      this.controller,
      this.icon,
      required this.obsureText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      style: Theme.of(context).textTheme.bodyText1,
      // textAlign: TextAlign.center,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      cursorColor: Theme.of(context).colorScheme.secondary,
      keyboardType: TextInputType.emailAddress,
      textInputAction: textInputAction,
      focusNode: focusNode,
      onFieldSubmitted: onSubmitted,
      validator: validator,
      obscureText: obsureText,
      decoration: InputDecoration(
        suffixIcon: icon,
        prefix: const SizedBox(
          width: 10,
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: Theme.of(context).colorScheme.onSurface,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Theme.of(context).colorScheme.secondary,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Theme.of(context).colorScheme.onSurface,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(9),
        ),
        disabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Theme.of(context).colorScheme.onSurface,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(9),
        ),
      ),
    );
  }
}
