import 'package:flutter/material.dart';
import 'package:mindspa_mobile/src/UI/for_you/for_you_viewmodel.dart';
import 'package:stacked/stacked.dart';

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
        return const Scaffold(
          body: Center(
            child: Text(
              'ForYouView',
            ),
          ),
        );
      },
    );
  }
}
