// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:mindspa_mobile/src/UI/for_you/for_you_viewmodel.dart';
import 'package:mindspa_mobile/src/core/constant/app_colors.dart';
import 'package:mindspa_mobile/src/core/constant/app_images.dart';
import 'package:mindspa_mobile/src/core/constant/app_strings.dart';
import 'package:mindspa_mobile/src/UI/shared/smartwidgets/statusbar.dart';
import 'package:stacked/stacked.dart';

import '../shared/dumb_widgets/scaffold_decorator.dart';
import '../shared/dumb_widgets/spacing.dart';

class ForYouView extends StatelessWidget {
  const ForYouView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ForYouViewModel>.reactive(
      viewModelBuilder: () => ForYouViewModel(),
      builder: (
        BuildContext context,
        ForYouViewModel model,
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
                AppStrings.forYou,
                style: Theme.of(context).textTheme.headline2,
              ),
            ),
            backgroundColor: Theme.of(context).colorScheme.primaryVariant,
            body: ScaffoldBackgroundDecorator(
              child: SafeArea(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ForYouItems(
                        firstText: 'Listen Now',
                        secondText: AppStrings.audio,
                        imagePath: AppImages.forYouAudios,
                        onTap: () {},
                      ),
                      ForYouItems(
                        firstText: 'Read More',
                        secondText: AppStrings.articles,
                        imagePath: AppImages.forYouarticles,
                        onTap: model.goToArticleView,
                      ),
                      ForYouItems(
                        firstText: 'Watch',
                        secondText: 'Videos',
                        imagePath: AppImages.forYouVideos,
                        onTap: () {},
                      ),
                      ForYouItems(
                        firstText: 'Study',
                        secondText: AppStrings.courses,
                        imagePath: AppImages.forYoucourses,
                        onTap: () {},
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

class ForYouItems extends StatelessWidget {
  final VoidCallback onTap;
  final String firstText;
  final String secondText;
  final String imagePath;
  const ForYouItems({
    Key? key,
    required this.onTap,
    required this.firstText,
    required this.secondText,
    required this.imagePath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: const BoxDecoration(
          color: AppColors.lightGreen,
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 10),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    firstText,
                    style: Theme.of(context).textTheme.bodyText1!.copyWith(
                          color: AppColors.white,
                          fontSize: 12,
                        ),
                  ),
                  const Spacing.smallHeight(),
                  FittedBox(
                    child: Text(
                      secondText,
                      style: Theme.of(context)
                          .textTheme
                          .bodyText1!
                          .copyWith(fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ),
            ),
            Flexible(
              child: Image.asset(imagePath),
            ),
          ],
        ),
      ),
    );
  }
}
