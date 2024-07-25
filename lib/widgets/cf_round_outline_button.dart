import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ppui_demo/utils/extensions.dart';
import 'package:ppui_demo/values/app_assets.dart';
import 'package:ppui_demo/values/app_number_constants.dart';

class CfRoundOutlineButton extends StatelessWidget {
  const CfRoundOutlineButton({
    required this.icon,
    required this.onTap,
    this.padding = const EdgeInsets.all(11),
    this.margin,
    this.iconSize = AppNumberConstants.roundOutlineBtnIconSize,
    super.key,
  });

  CfRoundOutlineButton.back(BuildContext context, {super.key})
      : icon = AppAssets.back,
        iconSize = AppNumberConstants.backIconSize,
        onTap = Navigator.of(context).pop,
        padding = const EdgeInsets.all(12.33),
        margin = const EdgeInsets.only(left: 16);

  final String icon;
  final EdgeInsets padding;
  final EdgeInsets? margin;
  final VoidCallback onTap;
  final double? iconSize;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: padding,
        margin: margin,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: context.appColor.roundOutline),
        ),
        child: SizedBox.square(
          dimension: iconSize,
          child: Align(child: SvgPicture.asset(icon)),
        ),
      ),
    );
  }
}
