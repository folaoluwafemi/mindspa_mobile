import 'package:flutter/material.dart';
import 'package:mindspa_mobile/src/core/constant/app_strings.dart';

class ArticlesView extends StatelessWidget {
  const ArticlesView({Key? key}) : super(key: key);

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
          AppStrings.articles,
          style: Theme.of(context)
              .textTheme
              .headline2!
              .copyWith(fontWeight: FontWeight.w100),
        ),
      ),
    );
  }
}
