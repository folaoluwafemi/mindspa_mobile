// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mindspa_mobile/src/core/constant/app_images.dart';
import 'package:mindspa_mobile/src/core/constant/app_strings.dart';

import '../shared/dumb_widgets/spacing.dart';

class SleepAndRelaxationView extends StatelessWidget {
  const SleepAndRelaxationView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(
            Icons.arrow_back,
            size: 30,
            color: Theme.of(context).colorScheme.primaryVariant,
          ),
        ),
        title: Text(
          AppStrings.sleep,
          style: Theme.of(context)
              .textTheme
              .headline2!
              .copyWith(fontWeight: FontWeight.w100),
        ),
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 35),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Spacing.mediumHeight(),
                  Column(
                    children: [
                      Text(
                        AppStrings.startJourney,
                        textAlign: TextAlign.start,
                        style: Theme.of(context)
                            .textTheme
                            .headline4!
                            .copyWith(fontSize: 17),
                      ),
                    ],
                  ),
                  const Spacing.mediumHeight(),
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 50, horizontal: 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                AppStrings.streamOfHypnosis,
                                style: Theme.of(context)
                                    .textTheme
                                    .headline4!
                                    .copyWith(fontSize: 16),
                              ),
                              Text(
                                '24 mins',
                                style: Theme.of(context).textTheme.bodyText2,
                              )
                            ],
                          ),
                          Expanded(
                            child: SvgPicture.asset(
                              AppImages.sleepAvatar1,
                              fit: BoxFit.cover,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  const Spacing.bigHeight(),
                  Text(
                    AppStrings.sleepMeditation,
                    style: Theme.of(context)
                        .textTheme
                        .headline4!
                        .copyWith(fontSize: 17),
                  ),
                  const Spacing.mediumHeight(),
                  GridView(
                    children: [
                      for (var i = 0; i < 8; i++)
                        GridTile(
                          child: SvgPicture.asset(
                            AppImages.sleepAvatar1,
                            fit: BoxFit.contain,
                          ),
                          footer: GridTileBar(
                            backgroundColor:
                                Theme.of(context).colorScheme.onSurface,
                            title: const Text(
                              'White Noise',
                              textAlign: TextAlign.center,
                            ),
                          ),
                        )
                    ],
                    shrinkWrap: true,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
