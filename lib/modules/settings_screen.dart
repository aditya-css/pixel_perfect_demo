import 'package:flutter/material.dart';
import 'package:ppui_demo/utils/extensions.dart';
import 'package:ppui_demo/values/app_assets.dart';
import 'package:ppui_demo/values/app_number_constants.dart';
import 'package:ppui_demo/values/app_strings.dart';
import 'package:ppui_demo/widgets/cf_action_tile.dart';
import 'package:ppui_demo/widgets/cf_app_bar.dart';
import 'package:ppui_demo/widgets/cf_icon_bg_button.dart';
import 'package:ppui_demo/widgets/cf_round_outline_button.dart';
import 'package:ppui_demo/widgets/cf_scaffold.dart';
import 'package:ppui_demo/widgets/cf_switch.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  var notificationState = true;

  @override
  Widget build(BuildContext context) {
    return CfScaffold(
      appBar: CfAppBar(
        title: AppStrings.settings,
        leading: CfRoundOutlineButton.back(context),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(16, 20, 16, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              child: Image.asset(
                AppAssets.settings,
                height: AppNumberConstants.settingsAvatarHeight,
              ),
            ),
            const SizedBox(height: 16),
            CfActionTile(
              leading:
                  const CfIconBgButton.circular(icon: AppAssets.notification),
              trailing: CfSwitch(initial: notificationState),
              title: AppStrings.notifications,
              onTap: () {
                setState(() => notificationState = !notificationState);
              },
              margin: const EdgeInsets.only(bottom: 13),
            ),
            Text(
              AppStrings.accountInformation,
              style: context.appTextTheme.h5,
            ),
            const SizedBox(height: 16),
            const CfActionTile(
              leading: CfIconBgButton.circular(icon: AppAssets.name),
              title: AppStrings.name,
              subtitle: AppStrings.userName,
            ),
            const CfActionTile(
              leading: CfIconBgButton.circular(icon: AppAssets.email),
              title: AppStrings.email,
              subtitle: AppStrings.userMail,
            ),
            const CfActionTile(
              leading: CfIconBgButton.circular(icon: AppAssets.pass),
              title: AppStrings.password,
              subtitle: AppStrings.changed2weeksAgo,
            ),
          ],
        ),
      ),
    );
  }
}
