// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:mindspa_mobile/src/UI/profile/profile_viewmodel.dart';
import 'package:mindspa_mobile/src/core/constant/app_colors.dart';
import 'package:mindspa_mobile/src/core/constant/app_strings.dart';
import 'package:mindspa_mobile/src/UI/shared/smartwidgets/statusbar.dart';
import 'package:stacked/stacked.dart';

import '../shared/dumb_widgets/scaffold_decorator.dart';
import '../shared/dumb_widgets/spacing.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ProfileViewModel>.reactive(
      onModelReady: (model) => model.getUserDetails(),
      viewModelBuilder: () => ProfileViewModel(),
      builder: (
        BuildContext context,
        ProfileViewModel model,
        Widget? child,
      ) {
        return Statusbar(
          child: Scaffold(
            appBar: AppBar(
              backgroundColor: AppColors.lightGreenVariant,
              shadowColor: Colors.transparent,
              elevation: 0,
              centerTitle: true,
              title: Text(
                AppStrings.profile,
                style: Theme.of(context).textTheme.headline2,
              ),
            ),
            backgroundColor: Theme.of(context).colorScheme.primaryVariant,
            body: ScaffoldBackgroundDecorator(
                child: SafeArea(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30.0, vertical: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Theme.of(context)
                                  .colorScheme
                                  .secondaryVariant,
                            ),
                          ),
                          child: const Icon(
                            Icons.image,
                            size: 100,
                          ),
                        ),
                        const Spacing.smallWidth(),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              FittedBox(
                                child: Text(
                                  model.currentUserdisplayname.toString(),
                                  style: Theme.of(context).textTheme.headline2,
                                ),
                              ),
                              const Spacing.mediumHeight(),
                              Text(
                                model.currentUserEmail.toString(),
                                style: Theme.of(context).textTheme.headline4,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                    const Spacing.mediumHeight(),
                    const CustomSwitchListTile(
                      text: AppStrings.notification,
                    ),
                    const Divider(
                      color: AppColors.grey,
                    ),
                    const Spacing.smallHeight(),
                    const CustomProfileNames(
                      text: AppStrings.language,
                    ),
                    const Spacing.smallHeight(),
                    const Divider(
                      color: AppColors.grey,
                    ),
                    const CustomSwitchListTile(text: AppStrings.reminder),
                    const Divider(
                      color: AppColors.grey,
                    ),
                    const Spacing.smallHeight(),
                    GestureDetector(
                      onTap: model.goToSettings,
                      child:
                          const CustomProfileNames(text: AppStrings.settings),
                    ),
                    const Spacing.smallHeight(),
                    const Divider(
                      color: AppColors.grey,
                    ),
                    const Spacing.smallHeight(),
                    GestureDetector(
                      onTap: () => model.signOut(),
                      child: const CustomProfileNames(
                        text: AppStrings.signOut,
                      ),
                    ),
                  ],
                ),
              ),
            )),
          ),
        );
      },
    );
  }
}

class CustomProfileNames extends StatelessWidget {
  final String text;
  final Color? color;

  const CustomProfileNames({
    Key? key,
    required this.text,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Theme.of(context)
          .textTheme
          .headline4!
          .copyWith(color: color ?? AppColors.white),
    );
  }
}

class CustomSwitchListTile extends StatelessWidget {
  final String text;

  const CustomSwitchListTile({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SwitchListTile(
      value: false,
      onChanged: (newValue) {},
      title: Text(
        text,
        style: Theme.of(context).textTheme.headline4,
      ),
      activeTrackColor: Theme.of(context).colorScheme.primary,
      activeColor: Theme.of(context).colorScheme.primaryVariant,
      contentPadding: const EdgeInsets.only(left: 0.0, right: 0.0),
    );
  }
}
