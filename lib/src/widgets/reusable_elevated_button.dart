import 'package:flutter/material.dart';

class ReuseableElevatedButton extends StatelessWidget {
  final String childText;
  final VoidCallback onPressed;
  const ReuseableElevatedButton({
    Key? key,
    required this.childText,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          primary: Theme.of(context).colorScheme.onSecondary,
          shape: const StadiumBorder()),
      onPressed: onPressed,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 10),
        child: Text(childText, style: Theme.of(context).textTheme.headline2),
      ),
    );
  }
}
