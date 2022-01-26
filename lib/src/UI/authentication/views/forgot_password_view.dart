import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../viewmodels/forgot_password_viewmodel.dart';

class ForgotPasswordView extends StatelessWidget {
  const ForgotPasswordView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ForgotPasswordViewModel>.reactive(
      viewModelBuilder: () => ForgotPasswordViewModel(),
      builder: (
        BuildContext context,
        ForgotPasswordViewModel model,
        Widget? child,
      ) {
        return const Scaffold(
          body: Center(
            child: Text(
              'ForgotPasswordView',
            ),
          ),
        );
      },
    );
  }
}
