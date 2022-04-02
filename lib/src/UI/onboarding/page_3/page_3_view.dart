import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:mindspa_mobile/src/UI/onboarding/page_3/page_3_viewmodel.dart';
import 'package:mindspa_mobile/src/core/constant/app_colors.dart';
import 'package:mindspa_mobile/src/core/constant/app_images.dart';
import 'package:mindspa_mobile/src/core/constant/app_strings.dart';
import 'package:stacked/stacked.dart';

import '../../shared/dumb_widgets/spacing.dart';

class Page3View extends StatelessWidget {
  const Page3View({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<Page3ViewModel>.nonReactive(
      viewModelBuilder: () => Page3ViewModel(),
      builder: (
        BuildContext context,
        Page3ViewModel model,
        Widget? child,
      ) {
        return Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.60,
              width: double.infinity,
              child: Image.asset(
                AppImages.onboardingImage3,
                fit: BoxFit.cover,
              ),
            ),
            const Spacing.mediumHeight(),
            Text(
              AppStrings.onBoardingText3,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headline1,
            ),
            const Spacing.smallHeight(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                AppStrings.onBoardingSubText3,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headline4,
              ),
            ),
            const Spacing.largeHeight(),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: AppColors.lightGreen,
              ),
              onPressed: model.navigateToSignUp,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: Text(
                  AppStrings.getStarted,
                  style: Theme.of(context).textTheme.headline3,
                ),
              ),
            ),
            const Spacing.smallHeight(),
            RichText(
              text: TextSpan(
                text: '${AppStrings.haveAccount} ',
                children: [
                  TextSpan(
                    recognizer: TapGestureRecognizer()
                      ..onTap = () => model.navigateToLogin(),
                    text: AppStrings.login,
                    style: const TextStyle(
                        color: AppColors.lightGreen,
                        fontWeight: FontWeight.bold),
                  )
                ],
              ),
            )
          ],
        );
      },
    );
  }
}
