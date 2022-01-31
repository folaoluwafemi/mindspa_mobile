import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mindspa_mobile/src/core/constant/app_colors.dart';
import 'package:mindspa_mobile/src/core/constant/app_images.dart';
import 'package:mindspa_mobile/src/core/constant/app_strings.dart';
import 'package:mindspa_mobile/src/core/utilities/validation_extension.dart';
import 'package:mindspa_mobile/src/widgets/reusable_circular_progress_indicator.dart';
import 'package:mindspa_mobile/src/widgets/reusable_elevated_button.dart';
import 'package:mindspa_mobile/src/widgets/reusable_text_field.dart';
import 'package:mindspa_mobile/src/widgets/scaffold_decorator.dart';
import 'package:mindspa_mobile/src/widgets/spacing.dart';
import 'package:stacked/stacked.dart';

import '../viewmodels/forgot_password_viewmodel.dart';

class ForgotPasswordView extends StatefulWidget {
  const ForgotPasswordView({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordView> createState() => _ForgotPasswordViewState();
}

class _ForgotPasswordViewState extends State<ForgotPasswordView> {
  final emailAddressController = TextEditingController();
  final _form = GlobalKey<FormState>();

  @override
  void dispose() {
    emailAddressController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ForgotPasswordViewModel>.reactive(
      viewModelBuilder: () => ForgotPasswordViewModel(),
      builder: (
        BuildContext context,
        ForgotPasswordViewModel model,
        Widget? child,
      ) {
        return WillPopScope(
          onWillPop: () async => false,
          child: Scaffold(
            appBar: AppBar(
              title: Text(
                AppStrings.forgotPassword,
                style: Theme.of(context).textTheme.headline3,
              ),
              leading: IconButton(
                onPressed: () => Navigator.pop(context),
                icon: const Icon(
                  Icons.arrow_back,
                  color: AppColors.light,
                ),
              ),
            ),
            backgroundColor: Theme.of(context).colorScheme.primary,
            body: ScaffoldBackgroundDecorator(
              backgroundImage: AppImages.auth,
              child: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: SingleChildScrollView(
                    child: Form(
                      key: _form,
                      child: model.isBusy
                          ? const ReuseableCircularProgressIndicator()
                          : Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * 0.20,
                                  child: Center(
                                      child: SvgPicture.asset(
                                          AppImages.forgotPasswordSvg)),
                                ),
                                Text(
                                  AppStrings.forgotPasswordMainText,
                                  style: Theme.of(context).textTheme.headline4,
                                  textAlign: TextAlign.center,
                                ),
                                Text(
                                  AppStrings.email,
                                  style: Theme.of(context).textTheme.headline4,
                                ),
                                const Spacing.smallHeight(),
                                ReusableTextField(
                                  obsureText: false,
                                  controller: emailAddressController,
                                  validator: context.validateEmailAddress,
                                  textInputAction: TextInputAction.done,
                                  // onSubmitted: (value) {
                                  //   FocusScope.of(context)
                                  //       .requestFocus(passwordFocusNode);
                                  // },
                                ),
                                const Spacing.mediumHeight(),
                                Center(
                                  child: ReuseableElevatedButton(
                                      childText: 'Submit',
                                      onPressed: () async {
                                        FocusScope.of(context).unfocus();
                                        if (_form.currentState!.validate()) {
                                          await model.resetPassword(
                                              emailAddressController.text
                                                  .trim());
                                        }
                                      }),
                                )
                              ],
                            ),
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
