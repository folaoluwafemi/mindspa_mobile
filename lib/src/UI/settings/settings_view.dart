import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mindspa_mobile/src/UI/settings/settings_viewmodel.dart';
import 'package:mindspa_mobile/src/core/constant/app_images.dart';
import 'package:mindspa_mobile/src/core/constant/app_strings.dart';
import 'package:mindspa_mobile/src/widgets/reusable_circular_progress_indicator.dart';
import 'package:mindspa_mobile/src/widgets/scaffold_decorator.dart';
import 'package:mindspa_mobile/src/widgets/statusbar.dart';
import 'package:stacked/stacked.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SettingsViewModel>.nonReactive(
      viewModelBuilder: () => SettingsViewModel(),
      builder: (
        BuildContext context,
        SettingsViewModel model,
        Widget? child,
      ) {
        return Statusbar(
          child: Scaffold(
            appBar: AppBar(
              leading: IconButton(
                onPressed: model.goBack,
                icon: Icon(
                  Icons.arrow_back,
                  color: Theme.of(context).colorScheme.primaryVariant,
                ),
              ),
              backgroundColor: Theme.of(context).colorScheme.onSurface,
              shadowColor: Colors.transparent,
              elevation: 0,
              centerTitle: true,
              title: Text(
                AppStrings.settings,
                style: Theme.of(context).textTheme.headline2,
              ),
            ),
            backgroundColor: Theme.of(context).colorScheme.primaryVariant,
            body: ScaffoldBackgroundDecorator(
              child: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 30.0, vertical: 15),
                  child: model.isBusy
                      ? const ReuseableCircularProgressIndicator()
                      : Column(
                          children: [
                            const ReusableListTile(
                              imagePath: AppImages.accountsSvg,
                              title: AppStrings.accountInfo,
                            ),
                            const ReusableListTile(
                              imagePath: AppImages.passwordSvg,
                              title: AppStrings.changePassWord,
                            ),
                            const ReusableListTile(
                              title: AppStrings.downloads,
                              imagePath: AppImages.downloadsSvg,
                            ),
                            const ReusableListTile(
                              title: AppStrings.myFavourites,
                              imagePath: AppImages.favouritesSvg,
                            ),
                            const ReusableListTile(
                              title: AppStrings.reminder,
                              imagePath: AppImages.reminderSvg,
                            ),
                            const ReusableListTile(
                              imagePath: AppImages.helpsupportSvg,
                              title: AppStrings.helpSupport,
                            ),
                            const ReusableListTile(
                              imagePath: AppImages.aboutSvg,
                              title: AppStrings.about,
                            ),
                            GestureDetector(
                              onTap: model.signOut,
                              child: const ReusableListTile(
                                imagePath: AppImages.signOutSvg,
                                title: AppStrings.signOut,
                              ),
                            ),
                          ],
                        ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

class ReusableListTile extends StatelessWidget {
  final String imagePath;

  final String title;

  const ReusableListTile({
    Key? key,
    required this.imagePath,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.only(),
      leading: SvgPicture.asset(
        imagePath,
        // color: Theme.of(context).colorScheme.secondaryVariant,
      ),
      title: Text(
        title,
        style: Theme.of(context).textTheme.headline3,
      ),
    );
  }
}
