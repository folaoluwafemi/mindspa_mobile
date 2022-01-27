import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:mindspa_mobile/src/UI/get%20started/get_started_viewmodel.dart';
import 'package:mindspa_mobile/src/core/constant/app_images.dart';
import 'package:mindspa_mobile/src/core/constant/app_strings.dart';
import 'package:mindspa_mobile/src/widgets/spacing.dart';
import 'package:mindspa_mobile/src/widgets/statusbar.dart';
import 'package:stacked/stacked.dart';

class GetStartedView extends StatelessWidget {
  const GetStartedView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<GetStartedViewModel>.nonReactive(
      viewModelBuilder: () => GetStartedViewModel(),
      builder: (
        BuildContext context,
        GetStartedViewModel model,
        Widget? child,
      ) {
        return SafeArea(
            child: Statusbar(
                child: Scaffold(
          backgroundColor: Theme.of(context).colorScheme.primary,
          body: Column(
            children: [
              Image.asset(AppImages.onboardingImage3),
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
              const Spacing.smallHeight(),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary: Theme.of(context).colorScheme.onSecondary),
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
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.onSecondary,
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        )));
      },
    );
  }
}
