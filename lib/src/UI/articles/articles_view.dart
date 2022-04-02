// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../core/constant/app_strings.dart';
import '../../UI/articles/articles_viewmodel.dart';

class ArticlesView extends StatelessWidget {
  const ArticlesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ArticlesViewModel>.reactive(
      viewModelBuilder: () => ArticlesViewModel(),
      builder: (
        BuildContext context,
        ArticlesViewModel model,
        Widget? child,
      ) {
        return Scaffold(
          appBar: AppBar(
            leading: IconButton(
              onPressed: () => model.navigateBack(),
              icon: Icon(
                Icons.arrow_back,
                size: 30,
                color: Theme.of(context).colorScheme.primaryVariant,
              ),
            ),
            title: Text(
              AppStrings.articles,
              style: Theme.of(context)
                  .textTheme
                  .headline2!
                  .copyWith(fontWeight: FontWeight.w100),
            ),
          ),
        );
      },
    );
  }
}
