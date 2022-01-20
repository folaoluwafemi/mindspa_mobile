import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mindspa_mobile/src/core/constant/app_images.dart';
import 'package:mindspa_mobile/src/core/constant/app_strings.dart';
import 'package:mindspa_mobile/src/core/utilities/app_functions.dart';
import 'package:mindspa_mobile/src/features/for_you/view/for_you_view.dart';
import 'package:mindspa_mobile/src/features/home/view/home_view.dart';
import 'package:mindspa_mobile/src/features/mind_bot/view/mind_bot.dart';
import 'package:mindspa_mobile/src/features/profile/view/profile_view.dart';
import 'package:mindspa_mobile/src/widgets/statusbar.dart';
import 'package:provider/provider.dart';

class HomeWrapperView extends StatelessWidget {
  const HomeWrapperView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _currentIndex = context.watch<AppFunctions>().currentIndex;
    return Statusbar(
      child: Scaffold(
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: _currentIndex,
            onTap: (newIndex) =>
                context.read<AppFunctions>().setCurrentIndex(newIndex),
            selectedItemColor: Theme.of(context).colorScheme.secondary,
            unselectedItemColor: Theme.of(context).colorScheme.primary,
            showUnselectedLabels: true,
            type: BottomNavigationBarType.fixed,
            items: [
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  AppImages.homeButton,
                  color: _currentIndex == 0
                      ? Theme.of(context).colorScheme.secondary
                      : Theme.of(context).colorScheme.primary,
                ),
                label: AppStrings.home,
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  AppImages.forYouButton,
                  color: _currentIndex == 1
                      ? Theme.of(context).colorScheme.secondary
                      : Theme.of(context).colorScheme.primary,
                ),
                label: AppStrings.forYou,
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  AppImages.mindBotButton,
                  color: _currentIndex == 2
                      ? Theme.of(context).colorScheme.secondary
                      : Theme.of(context).colorScheme.primary,
                ),
                label: AppStrings.mindbot,
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  AppImages.profileButton,
                  color: _currentIndex == 3
                      ? Theme.of(context).colorScheme.secondary
                      : Theme.of(context).colorScheme.primary,
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
          ][context.watch<AppFunctions>().currentIndex]),
    );
  }
}
