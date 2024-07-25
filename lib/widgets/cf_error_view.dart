import 'package:flutter/material.dart';
import 'package:ppui_demo/utils/extensions.dart';
import 'package:ppui_demo/values/app_assets.dart';
import 'package:ppui_demo/values/app_number_constants.dart';

class CfErrorView extends StatelessWidget {
  const CfErrorView({
    required this.title,
    required this.description,
    this.action,
    super.key,
  });

  final String title;
  final String description;
  final Widget? action;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: context.appColor.scaffoldBg,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Flexible(
            child: Image.asset(AppAssets.coolKidSitting),
          ),
          Text(
            title,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: context.appTextTheme.h4,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
          Text(
            description,
            textAlign: TextAlign.center,
            style: context.appTextTheme.paragraphMedium.copyWith(
              letterSpacing: -0.03,
            ),
          ),
          if (action case final action?) action,
        ],
      ),
    );
  }
}
