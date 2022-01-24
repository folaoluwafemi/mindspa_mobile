import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mindspa_mobile/src/core/constant/app_images.dart';
import 'package:mindspa_mobile/src/core/constant/app_strings.dart';
import 'package:mindspa_mobile/src/widgets/spacing.dart';

class ForYouView extends StatelessWidget {
  const ForYouView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          AppStrings.forYou,
          style: Theme.of(context)
              .textTheme
              .headline2!
              .copyWith(fontWeight: FontWeight.w100),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const Spacing.mediumHeight(),
          ForYouListedCards(
            title: AppStrings.audio,
            svgImagePath: AppImages.learnAvatar1,
            onTap: () {},
          ),
          const Spacing.smallHeight(),
          ForYouListedCards(
            title: AppStrings.articles,
            svgImagePath: AppImages.learnAvatar2,
            onTap: () {},
          ),
          const Spacing.smallHeight(),
          ForYouListedCards(
            title: AppStrings.courses,
            svgImagePath: AppImages.learnAvatar3,
            onTap: () {},
          ),
          const Spacing.smallHeight(),
        ],
      ),
    );
  }
}

class ForYouListedCards extends StatelessWidget {
  final String title;
  final String svgImagePath;
  final VoidCallback? onTap;
  const ForYouListedCards(
      {Key? key, required this.title, required this.svgImagePath, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          color: Theme.of(context).colorScheme.primary,
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 20, top: 15, bottom: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    title,
                    style: Theme.of(context).textTheme.headline2,
                  )
                ],
              ),
              SvgPicture.asset(svgImagePath)
            ],
          ),
        ),
      ),
    );
  }
}
