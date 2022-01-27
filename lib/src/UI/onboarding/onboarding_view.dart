import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:mindspa_mobile/src/UI/onboarding/onboarding_viewmodel.dart';
import 'package:mindspa_mobile/src/core/constant/app_colors.dart';
import 'package:mindspa_mobile/src/core/constant/app_images.dart';
import 'package:mindspa_mobile/src/core/constant/app_strings.dart';
import 'package:mindspa_mobile/src/widgets/spacing.dart';
import 'package:mindspa_mobile/src/widgets/statusbar.dart';
import 'package:stacked/stacked.dart';

class OnboardingView extends StatefulWidget {
  const OnboardingView({Key? key}) : super(key: key);

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  int currentIndex = 0;
  late PageController _pageController;
  @override
  void initState() {
    _pageController = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

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
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<OnboardingViewModel>.reactive(
        viewModelBuilder: () => OnboardingViewModel(),
        builder: (BuildContext context, OnboardingViewModel model,
                Widget? child) =>
            Statusbar(
              child: SafeArea(
                child: Scaffold(
                  extendBodyBehindAppBar: true,
                  backgroundColor: Theme.of(context).colorScheme.primary,
                  appBar: AppBar(
                    backgroundColor: Colors.transparent,
                    elevation: 0.0,
                    actions: [
                      TextButton(
                        onPressed: model.navigateToGetStarted,
                        child: Text("Skip",
                            style: Theme.of(context).textTheme.headline2),
                      )
                    ],
                  ),
                  body: PageView.builder(
                      itemCount: screens.length,
                      controller: _pageController,
                      onPageChanged: (int index) {
                        setState(() {
                          currentIndex = index;
                        });
                      },
                      itemBuilder: (_, index) {
                        return Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Image.asset(
                              screens[index].img,
                            ),
                            const Spacing.mediumHeight(),
                            Text(
                              screens[index].text,
                              textAlign: TextAlign.center,
                              style: Theme.of(context).textTheme.headline1,
                            ),
                            const Spacing.smallHeight(),
                            Text(
                              screens[index].desc,
                              textAlign: TextAlign.center,
                              style: Theme.of(context).textTheme.headline4,
                            ),
                            const Spacing.bigHeight(),
                            const Spacing.bigHeight(),
                            const Spacing.bigHeight(),
                            InkWell(
                              onTap: () async {
                                print(index);
                                if (index == screens.length - 1) {
                                  model.navigateToGetStarted();
                                }

                                _pageController.nextPage(
                                  duration: const Duration(milliseconds: 300),
                                  curve: Curves.ease,
                                );
                              },
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 30.0, vertical: 10),
                                decoration: BoxDecoration(
                                    color: AppColors.green,
                                    borderRadius: BorderRadius.circular(15.0)),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: const [
                                    Icon(
                                      Icons.arrow_forward,
                                      color: AppColors.light,
                                    )
                                  ],
                                ),
                              ),
                            )
                          ],
                        );
                      }),
                ),
              ),
            ));
  }
}

class OnboardModel {
  String img;
  String text;
  String desc;

  OnboardModel({
    required this.img,
    required this.text,
    required this.desc,
  });
}
