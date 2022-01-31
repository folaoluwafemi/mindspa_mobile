import 'dart:io';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:mindspa_mobile/src/UI/authentication/model/user_params.dart';
import 'package:mindspa_mobile/src/UI/authentication/viewmodels/register_viemmodel.dart';
import 'package:mindspa_mobile/src/widgets/reusable_circular_progress_indicator.dart';
import 'package:mindspa_mobile/src/widgets/scaffold_decorator.dart';
import 'package:mindspa_mobile/src/widgets/spacing.dart';

import 'package:mindspa_mobile/src/widgets/statusbar.dart';

import '../../../core/utilities/validation_extension.dart';
import 'package:mindspa_mobile/src/core/constant/app_images.dart';
import 'package:mindspa_mobile/src/core/constant/app_strings.dart';
import 'package:mindspa_mobile/src/widgets/external_auth_button.dart';
import 'package:mindspa_mobile/src/widgets/reusable_elevated_button.dart';
import 'package:mindspa_mobile/src/widgets/reusable_text_field.dart';

import 'package:stacked/stacked.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({Key? key}) : super(key: key);

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  final _formKey = GlobalKey<FormState>();
  final passwordFocusNode = FocusNode();
  final fullNameController = TextEditingController();
  final emailAddressController = TextEditingController();
  final passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<RegisterViewModel>.reactive(
      viewModelBuilder: () => RegisterViewModel(),
      builder: (
        BuildContext context,
        RegisterViewModel model,
        Widget? child,
      ) {
        return WillPopScope(
          onWillPop: () async => false,
          child: SafeArea(
            child: Statusbar(
              child: Scaffold(
                backgroundColor: Theme.of(context).colorScheme.primaryVariant,
                extendBodyBehindAppBar: true,
                body: ScaffoldBackgroundDecorator(
                  backgroundImage: AppImages.auth,
                  child: SafeArea(
                    child: Form(
                      key: _formKey,
                      child: SingleChildScrollView(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 34),
                          child: model.isBusy
                              ? const ReuseableCircularProgressIndicator()
                              : Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Spacing.largeHeight(),
                                    Text(AppStrings.signUp,
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline1),
                                    const SizedBox(
                                      height: 15,
                                    ),
                                    Text(
                                      AppStrings.displayName,
                                      style:
                                          Theme.of(context).textTheme.headline4,
                                    ),
                                    const Spacing.smallHeight(),

                                    ///FullName
                                    ///
                                    ReusableTextField(
                                      obsureText: false,
                                      controller: fullNameController,
                                      validator: context.validateFullName,
                                      textInputAction: TextInputAction.next,
                                    ),
                                    const Spacing.smallHeight(),

                                    ///EMAIL
                                    ///
                                    Text(
                                      AppStrings.email,
                                      style:
                                          Theme.of(context).textTheme.headline4,
                                    ),
                                    const Spacing.smallHeight(),
                                    ReusableTextField(
                                      obsureText: false,
                                      controller: emailAddressController,
                                      validator: context.validateEmailAddress,
                                      textInputAction: TextInputAction.next,
                                      onSubmitted: (value) {
                                        FocusScope.of(context)
                                            .requestFocus(passwordFocusNode);
                                      },
                                    ),
                                    const Spacing.smallHeight(),

                                    ///password
                                    ///
                                    Text(
                                      AppStrings.password,
                                      style:
                                          Theme.of(context).textTheme.headline4,
                                    ),
                                    const Spacing.smallHeight(),
                                    ReusableTextField(
                                      obsureText: model.obscurePassword,
                                      icon: IconButton(
                                        icon: Icon(
                                          model.obscurePassword
                                              ? Icons.visibility
                                              : Icons.visibility_off,
                                        ),
                                        onPressed:
                                            model.toggleRevealPasswordButton,
                                      ),
                                      controller: passwordController,
                                      textInputAction: TextInputAction.done,
                                      focusNode: passwordFocusNode,
                                      validator: context.validatePassword,
                                    ),

                                    const Spacing.largeHeight(),
                                    Center(
                                      child: RichText(
                                        textAlign: TextAlign.center,
                                        text: TextSpan(
                                          text: AppStrings.byContinuingShort,
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline4,
                                          children: <TextSpan>[
                                            TextSpan(
                                              text: AppStrings
                                                  .termAndConditionsOnly,
                                              style: TextStyle(
                                                  color: Theme.of(context)
                                                      .colorScheme
                                                      .onSecondary),
                                            ),
                                            const TextSpan(
                                                text: AppStrings.and),
                                            TextSpan(
                                              text: AppStrings.privacyPolicy,
                                              style: TextStyle(
                                                  color: Theme.of(context)
                                                      .colorScheme
                                                      .onSecondary),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    //Sign Up Button
                                    Center(
                                      child: ReuseableElevatedButton(
                                        childText: AppStrings.signUp,
                                        onPressed: () async {
                                          _formKey.currentState!.save();
                                          if (_formKey.currentState!
                                              .validate()) {
                                            await model.registerUser(
                                              userParams: UserParams(
                                                fullName:
                                                    fullNameController.text,
                                                emailAddress:
                                                    emailAddressController.text
                                                        .trim(),
                                                password:
                                                    passwordController.text,
                                              ),
                                            );
                                          }
                                        },
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Center(
                                      child: Text(
                                        AppStrings.or,
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline4,
                                      ),
                                    ),
                                    const Spacing.smallHeight(),
                                    Center(
                                      child: RichText(
                                        text: TextSpan(
                                          text: '${AppStrings.haveAccount} ',
                                          children: [
                                            TextSpan(
                                              recognizer: TapGestureRecognizer()
                                                ..onTap = () =>
                                                    model.navigateToLogin(),
                                              text: AppStrings.login,
                                              style: TextStyle(
                                                color: Theme.of(context)
                                                    .colorScheme
                                                    .onSecondary,
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                    const Spacing
                                        .mediumHeight(), // External External Authentication Providers
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 30),
                                      child: Row(
                                        mainAxisAlignment: Platform.isIOS
                                            ? MainAxisAlignment.spaceBetween
                                            : MainAxisAlignment.spaceEvenly,
                                        children: [
                                          ExternalAuthButtons(
                                            iconPath: AppImages.googleLogo,
                                            onTap: () {
                                              model.loginUserWithGoogle();
                                            },
                                          ),
                                          if (Platform.isIOS)
                                            ExternalAuthButtons(
                                              iconPath: AppImages.appleLogo,
                                              onTap: () {},
                                            ),
                                          ExternalAuthButtons(
                                            iconPath: AppImages.facebookLogo,
                                            onTap: () {},
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                        ),
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
