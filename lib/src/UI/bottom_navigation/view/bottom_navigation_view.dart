import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mindspa_mobile/src/UI/bottom_navigation/view/bottom_navigation_viewmodel.dart';
import 'package:mindspa_mobile/src/UI/for_you/for_you_view.dart';

import 'package:mindspa_mobile/src/UI/home/home_view.dart';
import 'package:mindspa_mobile/src/UI/mind_bot/mind_bot_view.dart';
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
        return WillPopScope(
          onWillPop: () async => false,
          child: Statusbar(
            child: Scaffold(
              extendBody: true,
              bottomNavigationBar: BottomNavigationBar(
                elevation: 0,
                backgroundColor: Theme.of(context).colorScheme.secondary,
                currentIndex: model.currentIndex,
                onTap: model.setIndex,
                selectedItemColor: Theme.of(context).colorScheme.primaryVariant,
                unselectedItemColor:
                    Theme.of(context).colorScheme.secondaryVariant,
                showUnselectedLabels: true,
                type: BottomNavigationBarType.fixed,
                items: [
                  BottomNavigationBarItem(
                    icon: SvgPicture.asset(
                      AppImages.homeButton,
                      color: model.currentIndex == 0
                          ? Theme.of(context).colorScheme.primaryVariant
                          : Theme.of(context).colorScheme.secondaryVariant,
                    ),
                    label: AppStrings.home,
                  ),
                  BottomNavigationBarItem(
                    icon: SvgPicture.asset(
                      AppImages.forYouButton,
                      color: model.currentIndex == 1
                          ? Theme.of(context).colorScheme.primaryVariant
                          : Theme.of(context).colorScheme.secondaryVariant,
                    ),
                    label: AppStrings.forYou,
                  ),
                  BottomNavigationBarItem(
                    icon: SvgPicture.asset(
                      AppImages.mindBotButton,
                      color: model.currentIndex == 2
                          ? Theme.of(context).colorScheme.primaryVariant
                          : Theme.of(context).colorScheme.secondaryVariant,
                    ),
                    label: AppStrings.mindbot,
                  ),
                  BottomNavigationBarItem(
                    icon: SvgPicture.asset(
                      AppImages.profileButton,
                      color: model.currentIndex == 3
                          ? Theme.of(context).colorScheme.primaryVariant
                          : Theme.of(context).colorScheme.secondaryVariant,
                    ),
                    label: AppStrings.profile,
                  ),
                ],
              ),
              body: [
                const HomeView(),
                const ForYouView(),
                const MindBotView(),
                const ProfileView(),
              ][model.currentIndex],
            ),
          ),
        );
      },
    );
  }
}
