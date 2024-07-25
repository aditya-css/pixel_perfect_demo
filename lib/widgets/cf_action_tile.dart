import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ppui_demo/utils/extensions.dart';
import 'package:ppui_demo/values/app_assets.dart';
import 'package:ppui_demo/values/app_number_constants.dart';

class CfActionTile extends StatelessWidget {
  const CfActionTile({
    required this.leading,
    required this.title,
    this.subtitle,
    this.trailing,
    this.onTap,
    this.margin = const EdgeInsets.only(bottom: 16),
    super.key,
  });

  final Widget leading;
  final Widget? trailing;
  final String title;
  final String? subtitle;
  final VoidCallback? onTap;
  final EdgeInsets margin;

  @override
  Widget build(BuildContext context) {
    final titleText = Text(
      title,
      maxLines: AppNumberConstants.actionTileTitleMaxLines,
      overflow: TextOverflow.ellipsis,
      style: context.appTextTheme.h5,
    );
    return Container(
      margin: margin,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(16)),
        border: Border.fromBorderSide(
          BorderSide(color: context.appColor.actionTileBorder),
        ),
      ),
      child: GestureDetector(
        onTap: onTap,
        behavior: HitTestBehavior.translucent,
        child: Padding(
          padding: subtitle == null
              ? const EdgeInsets.symmetric(
                  vertical: 24,
                  horizontal: 15,
                )
              : const EdgeInsets.symmetric(
                  vertical: 16.16,
                  horizontal: 15,
                ),
          child: Row(
            children: [
              leading,
              const SizedBox(width: 12),
              Expanded(
                child: subtitle == null
                    ? titleText
                    : Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          titleText,
                          Text(
                            subtitle!,
                            maxLines:
                                AppNumberConstants.actionTileSubTitleMaxLines,
                            overflow: TextOverflow.ellipsis,
                            style: context.appTextTheme.paragraphMedium
                                .copyWith(height: 1.83),
                          ),
                        ],
                      ),
              ),
              const SizedBox(width: 16),
              trailing ?? SvgPicture.asset(AppAssets.forward),
              trailing == null
                  ? const SizedBox(width: 8)
                  : const SizedBox(width: 5),
            ],
          ),
        ),
      ),
    );
  }
}
