import 'package:flutter/material.dart';
import 'package:mindspa_mobile/src/core/constant/app_images.dart';
import 'package:mindspa_mobile/src/core/constant/app_strings.dart';

import '../../shared/dumb_widgets/spacing.dart';

class Page2View extends StatelessWidget {
  const Page2View({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.60,
          width: double.infinity,
          child: Image.asset(
            AppImages.onboardingImage2,
            fit: BoxFit.cover,
          ),
        ),
        const Spacing.mediumHeight(),
        Text(
          AppStrings.onBoardingText2,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.headline1,
        ),
        const Spacing.smallHeight(),
        Text(
          AppStrings.onBoardingSubText2,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.headline4,
        ),
      ],
    );
  }
}
