import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:mindspa_mobile/src/core/constant/app_colors.dart';
import 'package:mindspa_mobile/src/core/constant/app_images.dart';
import 'package:mindspa_mobile/src/core/constant/app_strings.dart';
import 'package:mindspa_mobile/src/core/routes.dart';
import 'package:mindspa_mobile/src/widgets/external_auth_button.dart';
import 'package:mindspa_mobile/src/widgets/reusable_elevated_button.dart';
import 'package:mindspa_mobile/src/widgets/reusable_text_field.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isloading = true;

    void fakeLoading() {
      Future.delayed(const Duration(seconds: 3)).then((value) {
        isloading = !isloading;

        print(isloading);
      });
    }

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          reverse: true,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 34),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: SvgPicture.asset(AppImages.signinSignuplogo),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  AppStrings.signUp,
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w700,
                    fontSize: 25,
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Text(
                  AppStrings.email,
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w500,
                    fontSize: 20,
                  ),
                ),
                const ReusableTextField(),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  AppStrings.password,
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w500,
                    fontSize: 20,
                  ),
                ),
                const ReusableTextField(),
                const SizedBox(
                  height: 20,
                ),
                Center(
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: const TextSpan(
                      text: AppStrings.byContinuingShort,
                      style: TextStyle(
                        fontSize: 15,
                        color: AppColors.kBodyColor,
                      ),
                      children: <TextSpan>[
                        TextSpan(
                          text: AppStrings.termAndConditionsOnly,
                          style: TextStyle(color: AppColors.kLinksColor),
                        ),
                        TextSpan(text: AppStrings.and),
                        TextSpan(
                          text: AppStrings.privacyPolicy,
                          style: TextStyle(color: AppColors.kLinksColor),
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
                    onPressed: () =>
                        Navigator.pushNamed(context, Routes.signIn),
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
                        color: Colors.black),
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
                      color: AppColors.kBodyColor,
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
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      //TODO: Implement External Authentication Providers when tapped.
                      ExternalAuthButtons(
                        iconPath: AppImages.googleLogo,
                        onTap: () {},
                      ),
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
    );
  }
}
