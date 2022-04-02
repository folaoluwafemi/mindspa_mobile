import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'nutrition_viewmodel.dart';

class NutritionView extends StatelessWidget {
  const NutritionView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<NutritionViewModel>.reactive(
      viewModelBuilder: () => NutritionViewModel(),
      builder: (
        BuildContext context,
        NutritionViewModel model,
        Widget? child,
      ) {
        return const Scaffold(
          body: Center(
            child: Text(
              'NutritionView',
            ),
          ),
        );
      },
    );
  }
}
