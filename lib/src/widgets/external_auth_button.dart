import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';

class ExternalAuthButtons extends StatelessWidget {
  final String iconPath;
  final Function() onTap;
  const ExternalAuthButtons({
    Key? key,
    required this.iconPath,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(100),
            border: Border.all(
                width: 3, color: Theme.of(context).colorScheme.onSurface,),),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: SvgPicture.asset(
            iconPath,
            height: 43,
            width: 33,
          ),
        ),
      ),
    );
  }
}
