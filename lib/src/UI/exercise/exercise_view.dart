import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'exercise_viewmodel.dart';

class ExerciseView extends StatelessWidget {
  const ExerciseView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ExerciseViewModel>.reactive(
      viewModelBuilder: () => ExerciseViewModel(),
      builder: (
        BuildContext context,
        ExerciseViewModel model,
        Widget? child,
      ) {
        return const Scaffold(
          body: Center(
            child: Text(
              'ExerciseView',
            ),
          ),
        );
      },
    );
  }
}
