import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../viewmodels/verify_email_viewmodel.dart';

class VerifyEmailView extends StatelessWidget {
  const VerifyEmailView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<VerifyEmailViewModel>.reactive(
      viewModelBuilder: () => VerifyEmailViewModel(),
      builder: (
        BuildContext context,
        VerifyEmailViewModel model,
        Widget? child,
      ) {
        return const Scaffold(
          body: Center(
            child: Text(
              'VerifyEmailView',
            ),
          ),
        );
      },
    );
  }
}
