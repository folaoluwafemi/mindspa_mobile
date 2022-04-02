import 'package:flutter/material.dart';
import 'package:mindspa_mobile/src/UI/onboarding/onboarding_viewmodel.dart';
import 'package:mindspa_mobile/src/core/constant/app_colors.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:stacked/stacked.dart';

class OnboardingView extends StatefulWidget {
  const OnboardingView({Key? key}) : super(key: key);

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  final PageController _pageController = PageController();
  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<OnboardingViewModel>.reactive(
      viewModelBuilder: () => OnboardingViewModel(),
      builder: (
        BuildContext context,
        OnboardingViewModel model,
        Widget? child,
      ) {
        return WillPopScope(
          onWillPop: () async => false,
          child: Scaffold(
            backgroundColor: AppColors.green,
            body: Stack(
              children: [
                PageView(
                  controller: _pageController,
                  onPageChanged: model.setIndex,
                  children: model.screens,
                ),
                if (model.currentIndex < 2)
                  Container(
                    alignment: const Alignment(0, 0.80),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        GestureDetector(
                          child: Text(
                            'Skip',
                            style: Theme.of(context).textTheme.headline4,
                          ),
                          onTap: () {
                            _pageController.jumpToPage(2);
                          },
                        ),
                        SmoothPageIndicator(
                          controller: _pageController,
                          count: 3,
                          effect: const WormEffect(
                            activeDotColor: AppColors.white,
                          ),
                        ),
                        GestureDetector(
                          child: const Icon(
                            Icons.arrow_forward_rounded,
                            color: AppColors.white,
                          ),
                          onTap: () {
                            _pageController.nextPage(
                              duration: const Duration(milliseconds: 500),
                              curve: Curves.easeIn,
                            );
                          },
                        )
                      ],
                    ),
                  )
              ],
            ),
          ),
        );
      },
    );
  }
}
