import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mindspa_mobile/src/widgets/scaffold_decorator.dart';
import 'package:mindspa_mobile/src/widgets/spacing.dart';

import 'package:mindspa_mobile/src/widgets/statusbar.dart';

import '../../../core/utilities/validation_extension.dart';
import '../../../UI/authentication/viewmodels/login_viewmodel.dart';
import 'package:mindspa_mobile/src/core/constant/app_images.dart';
import 'package:mindspa_mobile/src/core/constant/app_strings.dart';
import 'package:mindspa_mobile/src/widgets/external_auth_button.dart';
import 'package:mindspa_mobile/src/widgets/reusable_elevated_button.dart';
import 'package:mindspa_mobile/src/widgets/reusable_text_field.dart';

import 'package:stacked/stacked.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);
  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final passwordFocusNode = FocusNode();
  final fullNameController = TextEditingController();
  final emailAddressController = TextEditingController();
  final passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<LoginViewModel>.nonReactive(
      viewModelBuilder: () => LoginViewModel(),
      builder: (
        BuildContext context,
        LoginViewModel model,
        Widget? child,
      ) {
        return SafeArea(
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
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Spacing.largeHeight(),
                            Text(AppStrings.login,
                                style: Theme.of(context).textTheme.headline1),
                            const SizedBox(
                              height: 15,
                            ),

                            ///EMAIL
                            ///
                            Text(
                              AppStrings.email,
                              style: Theme.of(context).textTheme.headline4,
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
                              style: Theme.of(context).textTheme.headline4,
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
                                onPressed: model.toggleRevealPasswordButton,
                              ),
                              controller: passwordController,
                              textInputAction: TextInputAction.done,
                              focusNode: passwordFocusNode,
                              validator: context.validatePassword,
                            ),

                            const SizedBox(
                              height: 20,
                            ),
                            Center(
                              child: RichText(
                                textAlign: TextAlign.center,
                                text: TextSpan(
                                  text: AppStrings.byContinuingShort,
                                  style: Theme.of(context).textTheme.headline4,
                                  children: <TextSpan>[
                                    TextSpan(
                                      text: AppStrings.termAndConditionsOnly,
                                      style: TextStyle(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .onSecondary),
                                    ),
                                    const TextSpan(text: AppStrings.and),
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
                                childText: AppStrings.login,
                                onPressed: () async {
                                  _formKey.currentState!.save();
                                  if (_formKey.currentState!.validate()) {
                                    model.loginUser(
                                      emailAddress:
                                          emailAddressController.text.trim(),
                                      password: passwordController.text,
                                    );
                                  }
                                },
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Center(
                              child: Text(AppStrings.or,
                                  style: Theme.of(context).textTheme.headline4),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Center(
                              child: Text(AppStrings.continueWith,
                                  textAlign: TextAlign.center,
                                  style: Theme.of(context).textTheme.headline4),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            // External External Authentication Providers
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 30),
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
        );
      },
    );
  }
}
