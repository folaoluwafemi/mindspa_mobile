import 'package:flutter/material.dart';
import 'package:mindspa_mobile/src/core/constant/app_colors.dart';
import 'package:mindspa_mobile/src/core/constant/app_images.dart';
import 'package:mindspa_mobile/src/core/constant/app_strings.dart';
import 'package:mindspa_mobile/src/widgets/reusable_circular_progress_indicator.dart';
import 'package:mindspa_mobile/src/widgets/scaffold_decorator.dart';
import 'package:mindspa_mobile/src/widgets/spacing.dart';
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
        return WillPopScope(
          onWillPop: () async => false,
          child: SafeArea(
            child: Scaffold(
              extendBodyBehindAppBar: true,
              backgroundColor: Theme.of(context).colorScheme.primary,
              appBar: AppBar(
                automaticallyImplyLeading: false,
                backgroundColor: Colors.transparent,
                elevation: 0,
                centerTitle: true,
                // leading: IconButton(
                //   color: AppColors.light,
                //   icon: Icon(Icons.arrow_back),
                //   onPressed: model.navigateback,
                // ),
              ),
              body: ScaffoldBackgroundDecorator(
                backgroundImage: AppImages.auth,
                child: SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 40,
                    ),
                    child: model.isBusy
                        ? const ReuseableCircularProgressIndicator()
                        : Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                AppStrings.verifyMail,
                                style: Theme.of(context).textTheme.headline1,
                              ),
                              const Icon(
                                Icons.mail,
                                size: 100,
                                color: AppColors.light,
                              ),
                              Text(
                                'Hey ${model.currentUserdisplayname}, a verification link has been sent to your email address: ${model.currentUserEmail}',
                                textAlign: TextAlign.center,
                                style: Theme.of(context).textTheme.headline2,
                              ),
                              const Spacing.mediumHeight(),
                              ElevatedButton.icon(
                                  onPressed: () => model.checkVerification(),
                                  icon: const Icon(Icons.email),
                                  label: Text(
                                    'Verifiy Email',
                                    style:
                                        Theme.of(context).textTheme.headline2,
                                  ))
                              // ReuseableElevatedButton(
                              //     childText: 'Verify Email',
                              //     onPressed: ),
                            ],
                          ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
