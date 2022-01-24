import 'package:flutter/material.dart';
import 'package:mindspa_mobile/src/core/constant/app_strings.dart';
import 'package:mindspa_mobile/src/widgets/dummy_card.dart';
import 'package:mindspa_mobile/src/widgets/spacing.dart';

class ExerciseView extends StatelessWidget {
  const ExerciseView({Key? key}) : super(key: key);

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
          AppStrings.exercise,
          style: Theme.of(context)
              .textTheme
              .headline2!
              .copyWith(fontWeight: FontWeight.w100),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Spacing.mediumHeight(),
              Text(
                AppStrings.low,
                style: Theme.of(context)
                    .textTheme
                    .headline4!
                    .copyWith(fontSize: 20),
              ),
              RichText(
                text: TextSpan(
                  text: AppStrings.exerciseText2,
                  style: Theme.of(context)
                      .textTheme
                      .headline6!
                      .copyWith(fontSize: 15),
                  children: [
                    TextSpan(
                        text: AppStrings.here,
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.secondary))
                  ],
                ),
              ),
              const Spacing.mediumHeight(),
              const DumbCards(),
              const Spacing.smallHeight(),
              Text(
                AppStrings.medium,
                style: Theme.of(context)
                    .textTheme
                    .headline4!
                    .copyWith(fontSize: 20),
              ),
              RichText(
                text: TextSpan(
                  text: AppStrings.exerciseText2,
                  style: Theme.of(context)
                      .textTheme
                      .headline6!
                      .copyWith(fontSize: 15),
                  children: [
                    TextSpan(
                        text: AppStrings.here,
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.secondary))
                  ],
                ),
              ),
              const Spacing.mediumHeight(),
              const DumbCards(),
              const Spacing.smallHeight(),
              Text(
                AppStrings.high,
                style: Theme.of(context)
                    .textTheme
                    .headline4!
                    .copyWith(fontSize: 20),
              ),
              RichText(
                text: TextSpan(
                  text: AppStrings.exerciseText2,
                  style: Theme.of(context)
                      .textTheme
                      .headline6!
                      .copyWith(fontSize: 15),
                  children: [
                    TextSpan(
                        text: AppStrings.here,
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.secondary))
                  ],
                ),
              ),
              const Spacing.smallHeight(),
              const DumbCards(),
              const Spacing.mediumHeight(),
            ],
          ),
        ),
      ),
    );
  }
}
