import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ppui_demo/utils/extensions.dart';
import 'package:ppui_demo/values/app_assets.dart';
import 'package:ppui_demo/values/app_number_constants.dart';
import 'package:ppui_demo/values/app_routes.dart';
import 'package:ppui_demo/values/app_strings.dart';
import 'package:ppui_demo/widgets/cf_filled_button.dart';
import 'package:ppui_demo/widgets/cf_icon_bg_button.dart';
import 'package:ppui_demo/widgets/cf_scaffold.dart';
import 'package:ppui_demo/widgets/cf_text_button.dart';
import 'package:ppui_demo/widgets/cf_text_field.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CfScaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: AppNumberConstants.loginTopPadding),
              Image.asset(
                AppAssets.coolKidSitting,
                height: AppNumberConstants.loginAvatarHeight,
              ),
              const SizedBox(height: 16),
              Text(
                AppStrings.login,
                style: context.appTextTheme.h4,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8),
              Text(
                AppStrings.loginWithSocial,
                textAlign: TextAlign.center,
                style: context.appTextTheme.paragraphMedium,
              ),
              const SizedBox(height: 8),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CfIconBgButton(icon: AppAssets.facebook),
                  SizedBox(width: 12),
                  CfIconBgButton(icon: AppAssets.instagram),
                  SizedBox(width: 12),
                  CfIconBgButton(icon: AppAssets.googlePlus),
                ],
              ),
              const SizedBox(height: 16),
              const CfTextField(
                hint: AppStrings.email,
                autofillHints: [AutofillHints.email],
                textInputAction: TextInputAction.next,
                textInputType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 16),
              CfTextField(
                hint: AppStrings.password,
                textInputAction: TextInputAction.done,
                obscureText: true,
                suffixIcon: InkWell(
                  onTap: () {},
                  child: Padding(
                    padding:
                        const EdgeInsets.only(right: 16),
                    child: SvgPicture.asset(AppAssets.visibilityOn),
                  ),
                ),
              ),
              CfTextButton(AppStrings.forgotPassword, onTap: () {}),
              CfFilledButton(
                AppStrings.login,
                onTap: () => context.push(AppRoutes.home),
              ),
              CfTextButton(AppStrings.signUp, onTap: () {}),
            ],
          ),
        ),
      ),
    );
  }
}
