import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mindspa_mobile/src/UI/authentication/model/user_params.dart';
import 'package:mindspa_mobile/src/UI/authentication/viewmodels/register_viemmodel.dart';
import 'package:mindspa_mobile/src/app/app.router.dart';

import 'package:mindspa_mobile/src/core/utilities/app_functions.dart';

import 'package:mindspa_mobile/src/widgets/statusbar.dart';
import 'package:provider/provider.dart';

import '../../../core/utilities/validation_extension.dart';
import 'package:mindspa_mobile/src/core/constant/app_images.dart';
import 'package:mindspa_mobile/src/core/constant/app_strings.dart';
import 'package:mindspa_mobile/src/widgets/external_auth_button.dart';
import 'package:mindspa_mobile/src/widgets/reusable_elevated_button.dart';
import 'package:mindspa_mobile/src/widgets/reusable_text_field.dart';

import 'package:stacked/stacked.dart';

class RegisterView extends HookWidget {
  RegisterView({Key? key}) : super(key: key);
  final _formKey = GlobalKey<FormState>();
  final passwordFocusNode = FocusNode();
  final fullNameController = useTextEditingController();
  final emailAddressController = useTextEditingController();
  final passwordController = useTextEditingController();
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<RegisterViewModel>.reactive(
      viewModelBuilder: () => RegisterViewModel(),
      builder: (
        BuildContext context,
        RegisterViewModel model,
        Widget? child,
      ) {
        return Statusbar(
          child: Scaffold(
            extendBodyBehindAppBar: true,
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              actions: [
                TextButton.icon(
                  onPressed: () =>
                      Navigator.pushNamed(context, Routes.loginView),
                  icon: Icon(Icons.account_circle,
                      color: Theme.of(context).colorScheme.secondary),
                  label: Text(
                    AppStrings.login,
                    style: Theme.of(context).textTheme.bodyText1!.copyWith(
                        color: Theme.of(context).colorScheme.secondary),
                  ),
                ),
              ],
            ),
            body: SafeArea(
              child: Form(
                key: _formKey,
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 34),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                          child: SvgPicture.asset(
                            AppImages.signinSignuplogo,
                            height: 100,
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Text(AppStrings.signUp,
                            style: Theme.of(context).textTheme.headline4),
                        const SizedBox(
                          height: 15,
                        ),
                        Text(
                          AppStrings.displayName,
                          style: Theme.of(context).textTheme.headline6,
                        ),

                        ///FullName
                        ///
                        ReusableTextField(
                          obsureText: false,
                          controller: fullNameController,
                          validator: context.validateFullName,
                          textInputAction: TextInputAction.next,
                        ),

                        ///EMAIL
                        ///
                        Text(
                          AppStrings.email,
                          style: Theme.of(context).textTheme.headline6,
                        ),
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
                        const SizedBox(
                          height: 10,
                        ),

                        ///password
                        ///
                        Text(
                          AppStrings.password,
                          style: Theme.of(context).textTheme.headline6,
                        ),
                        Consumer<AppFunctions>(
                          builder: (context, value, child) => ReusableTextField(
                            obsureText: value.obscurePassword,
                            icon: IconButton(
                                icon: Icon(
                                  value.obscurePassword
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                ),
                                onPressed: context
                                    .read<AppFunctions>()
                                    .toggleRevealPasswordButton),
                            controller: passwordController,
                            textInputAction: TextInputAction.done,
                            focusNode: passwordFocusNode,
                            validator: context.validatePassword,
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Center(
                          child: RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(
                              text: AppStrings.byContinuingShort,
                              style: Theme.of(context).textTheme.bodyText1,
                              children: <TextSpan>[
                                TextSpan(
                                  text: AppStrings.termAndConditionsOnly,
                                  style: TextStyle(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .surface),
                                ),
                                const TextSpan(text: AppStrings.and),
                                TextSpan(
                                  text: AppStrings.privacyPolicy,
                                  style: TextStyle(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .surface),
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
                              if (_formKey.currentState!.validate()) {
                                await model.registerUser(
                                  userParams: UserParams(
                                    fullName: fullNameController.text,
                                    emailAddress:
                                        emailAddressController.text.trim(),
                                    password: passwordController.text,
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
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w500,
                              fontSize: 15,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Center(
                          child: Text(
                            AppStrings.continueWith,
                            textAlign: TextAlign.center,
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w500,
                              fontSize: 15,
                              color: Theme.of(context).colorScheme.onSurface,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        // External External Authentication Providers
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 30),
                          child: Row(
                            mainAxisAlignment: Platform.isIOS
                                ? MainAxisAlignment.spaceBetween
                                : MainAxisAlignment.spaceEvenly,
                            children: [
                              //TODO: Implement External Authentication Providers when tapped.
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
        );
      },
    );
  }
}
