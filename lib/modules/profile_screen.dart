import 'package:flutter/material.dart';
import 'package:ppui_demo/values/app_assets.dart';
import 'package:ppui_demo/values/app_strings.dart';
import 'package:ppui_demo/widgets/cf_app_bar.dart';
import 'package:ppui_demo/widgets/cf_profile.dart';
import 'package:ppui_demo/widgets/cf_round_outline_button.dart';
import 'package:ppui_demo/widgets/cf_scaffold.dart';
import 'package:ppui_demo/widgets/cf_text_border_button.dart';
import 'package:ppui_demo/widgets/cf_text_button.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CfScaffold(
      appBar: CfAppBar(
        title: AppStrings.profile,
        leading: CfRoundOutlineButton.back(context),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            const SizedBox(height: 30),
            const CfProfile(AppAssets.profilePhoto),
            const SizedBox(height: 16),
            const CfTextBorderButton(title: AppStrings.yourCourses),
            const CfTextBorderButton(title: AppStrings.saved),
            const CfTextBorderButton(
              title: AppStrings.payment,
              margin: EdgeInsets.only(bottom: 4),
            ),
            CfTextButton(
              AppStrings.logout,
              onTap: () {},
              padding: EdgeInsets.zero,
            ),
          ],
        ),
      ),
    );
  }
}
