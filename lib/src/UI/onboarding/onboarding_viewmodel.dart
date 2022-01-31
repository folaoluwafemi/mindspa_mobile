import 'package:mindspa_mobile/src/app/app.locator.dart';
import 'package:mindspa_mobile/src/app/app.router.dart';
import 'package:mindspa_mobile/src/core/constant/app_images.dart';
import 'package:mindspa_mobile/src/core/constant/app_strings.dart';

import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import 'onboarding_model.dart';

class OnboardingViewModel extends IndexTrackingViewModel {
  
  final _navigationService = locator<NavigationService>();
  void navigateback() => _navigationService.back();
  void navigateToGetStarted() =>
      _navigationService.replaceWith(Routes.getStartedView);

  List<OnboardModel> screens = <OnboardModel>[
    OnboardModel(
      img: AppImages.onboardingImage1,
      text: AppStrings.onBoardingText1,
      desc: AppStrings.onBoardingSubText1,
    ),
    OnboardModel(
      img: AppImages.onboardingImage2,
      text: AppStrings.onBoardingText2,
      desc: AppStrings.onBoardingText2,
    ),
  ];
}
