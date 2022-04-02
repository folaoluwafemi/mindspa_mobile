// ignore_for_file: use_key_in_widget_constructors

import '../../../core/constant/app_ui_helpers.dart';
import 'package:flutter/material.dart';

class Spacing extends StatelessWidget {
  final double height;
  final double width;

  const Spacing.height(this.height) : width = UiHelper.zero;
  const Spacing.tinyHeight() : this.height(UiHelper.tiny);
  const Spacing.smallHeight() : this.height(UiHelper.small);
  const Spacing.mediumHeight() : this.height(UiHelper.medium);
  const Spacing.bigHeight() : this.height(UiHelper.big);
  const Spacing.largeHeight() : this.height(UiHelper.large);

  const Spacing.width(this.width) : height = UiHelper.zero;

  const Spacing.tinyWidth() : this.width(UiHelper.tiny);
  const Spacing.smallWidth() : this.width(UiHelper.small);
  const Spacing.mediumWidth() : this.width(UiHelper.medium);
  const Spacing.bigWidth() : this.width(UiHelper.big);
  const Spacing.largeWidth() : this.width(UiHelper.large);

  const Spacing.empty()
      : width = UiHelper.zero,
        height = UiHelper.zero;

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: height, width: width);
  }
}
