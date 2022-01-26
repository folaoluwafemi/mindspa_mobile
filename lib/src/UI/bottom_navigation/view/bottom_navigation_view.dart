import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mindspa_mobile/src/UI/bottom_navigation/view/bottom_navigation_viewmodel.dart';
import 'package:mindspa_mobile/src/UI/for_you/for_you_view.dart';

import 'package:mindspa_mobile/src/UI/home/home_view.dart';
import 'package:mindspa_mobile/src/UI/mind_bot/view/mind_bot.dart';
import 'package:mindspa_mobile/src/UI/profile/profile_view.dart';
import 'package:mindspa_mobile/src/core/constant/app_images.dart';
import 'package:mindspa_mobile/src/core/constant/app_strings.dart';
import 'package:mindspa_mobile/src/widgets/statusbar.dart';

import 'package:stacked/stacked.dart';

class BottomNavigationView extends StatelessWidget {
  const BottomNavigationView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<BottomNavigationViewModel>.reactive(
      viewModelBuilder: () => BottomNavigationViewModel(),
      builder: (
        BuildContext context,
        BottomNavigationViewModel model,
        Widget? child,
      ) {
        return Statusbar(
          child: Scaffold(
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: model.currentIndex,
              onTap: model.setIndex,
              selectedItemColor: Theme.of(context).colorScheme.secondary,
              unselectedItemColor: Theme.of(context).colorScheme.primary,
              showUnselectedLabels: true,
              type: BottomNavigationBarType.fixed,
              items: [
                BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    AppImages.homeButton,
                    color: model.currentIndex == 0
                        ? Theme.of(context).colorScheme.secondary
                        : Theme.of(context).colorScheme.primary,
                  ),
                  label: AppStrings.home,
                ),
                BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    AppImages.forYouButton,
                    color: model.currentIndex == 1
                        ? Theme.of(context).colorScheme.secondary
                        : Theme.of(context).colorScheme.primary,
                  ),
                  label: AppStrings.forYou,
                ),
                BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    AppImages.mindBotButton,
                    color: model.currentIndex == 2
                        ? Theme.of(context).colorScheme.secondary
                        : Theme.of(context).colorScheme.primary,
                  ),
                  label: AppStrings.mindbot,
                ),
                BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    AppImages.profileButton,
                    color: model.currentIndex == 3
                        ? Theme.of(context).colorScheme.secondary
                        : Theme.of(context).colorScheme.primary,
                  ),
                  label: AppStrings.profile,
                ),
              ],
            ),
            body: PageTransitionSwitcher(
              reverse: true,
              child: [
                const HomeView(),
                const ForYouView(),
                const MindBotView(),
                const ProfileView(),
              ][model.currentIndex],
              transitionBuilder: (child, primaryAnimation, secondaryAnimation) {
                return SharedAxisTransition(
                    child: child,
                    animation: primaryAnimation,
                    secondaryAnimation: secondaryAnimation,
                    transitionType: SharedAxisTransitionType.horizontal);
              },
              duration: const Duration(milliseconds: 300),
            ),
          ),
        );
      },
    );
  }
}
