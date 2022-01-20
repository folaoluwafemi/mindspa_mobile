import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:mindspa_mobile/src/core/constant/app_colors.dart';
import 'package:mindspa_mobile/src/core/constant/app_images.dart';
import 'package:mindspa_mobile/src/core/constant/app_strings.dart';
import 'package:mindspa_mobile/src/core/routes.dart';
import 'package:mindspa_mobile/src/widgets/reusable_elevated_button.dart';

class OnboardingView extends StatelessWidget {
  const OnboardingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.only(bottom: 60, top: 80),
        child: IntroductionScreen(
          pages: [
            PageViewModel(
              title: AppStrings.onBoardingText1,
              body: AppStrings.onBoardingSubText1,
              image: SvgPicture.asset(
                AppImages.onBoardingAvatar1,
                fit: BoxFit.cover,
              ),
              decoration: onboardingPageDecoration(),
            ),
            PageViewModel(
              title: AppStrings.onBoardingText2,
              body: AppStrings.onBoardingSubText2,
              image: SvgPicture.asset(
                AppImages.onBoardingAvatar2,
                fit: BoxFit.cover,
              ),
              decoration: onboardingPageDecoration(),
            ),
            PageViewModel(
              title: AppStrings.onBoardingText3,
              body: AppStrings.onBoardingSubText3,
              image: SvgPicture.asset(
                AppImages.onBoardingAvatar3,
                fit: BoxFit.cover,
              ),
              decoration: onboardingPageDecoration(),
            ),
            PageViewModel(
              title: AppStrings.onBoardingText4,
              body: AppStrings.onBoardingSubText4,
              image: SvgPicture.asset(
                AppImages.onBoardingAvatar1,
                fit: BoxFit.cover,
              ),
              footer: ReuseableElevatedButton(
                  childText: AppStrings.getStarted,
                  onPressed: () =>
                      Navigator.pushReplacementNamed(context, Routes.register)),
              decoration: onboardingPageDecoration(color: AppColors.dark),
            ),
          ],
          done: const Icon(Icons.arrow_forward_ios),
          onDone: () {},
          skip: const Text(AppStrings.skip),
          onSkip: () =>
              Navigator.pushReplacementNamed(context, Routes.register),
          showSkipButton: true,
          next: const Icon(Icons.arrow_forward_ios),
          color: AppColors.dark,
          isProgressTap: false,
          dotsDecorator: DotsDecorator(
            color: AppColors.grey,
            activeColor: AppColors.green,
            activeSize: const Size(22, 10),
            activeShape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(24),
            ),
          ),
        ),
      )),
    );
  }

  PageDecoration onboardingPageDecoration({Color? color}) {
    return PageDecoration(
      titleTextStyle: GoogleFonts.poppins(
          fontSize: 25, fontWeight: FontWeight.bold, color: AppColors.dark),
      bodyTextStyle: GoogleFonts.poppins(
          fontSize: 14, fontWeight: FontWeight.normal, color: AppColors.dark),
      titlePadding: const EdgeInsets.only(top: 16, bottom: 10),
    );
  }
}
