import 'package:flutter/material.dart';
import 'package:mindspa_mobile/src/core/constant/app_images.dart';

class ScaffoldBackgroundDecorator extends StatelessWidget {
  final Widget child;
  final String? backgroundImage;

  const ScaffoldBackgroundDecorator({
    Key? key,
    required this.child,
    this.backgroundImage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.onSurface,
          image: DecorationImage(
            image: AssetImage(
              backgroundImage ?? AppImages.scaffoldAuthImage1,
            ),
            opacity: 0.10,
            fit: BoxFit.fill,
            filterQuality: FilterQuality.high,
          ),
        ),
        child: child);
  }
}
