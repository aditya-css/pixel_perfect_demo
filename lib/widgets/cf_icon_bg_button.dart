import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ppui_demo/utils/extensions.dart';
import 'package:ppui_demo/values/app_number_constants.dart';

class CfIconBgButton extends StatelessWidget {
  const CfIconBgButton({
    required this.icon,
    this.padding = const EdgeInsets.all(AppNumberConstants.iconBgBtnPadding),
    this.shape = BoxShape.rectangle,
    this.size = const Size.square(24),
    this.radius,
    this.color,
    this.onTap,
    super.key,
  });

  const CfIconBgButton.circular({
    required this.icon,
    this.padding = const EdgeInsets.symmetric(vertical: 9, horizontal: 10),
    this.shape = BoxShape.circle,
    this.size = const Size(12, 14),
    this.color,
    this.onTap,
    super.key,
  }) : radius = null;

  final String icon;
  final EdgeInsets padding;
  final double? radius;
  final BoxShape shape;
  final Color? color;
  final VoidCallback? onTap;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: padding,
        decoration: BoxDecoration(
          color: color ?? context.appColor.iconBgBtn,
          shape: shape,
          borderRadius: shape == BoxShape.circle
              ? null
              : const BorderRadius.all(
                  Radius.circular(
                    AppNumberConstants.iconBgBtnRadius,
                  ),
                ),
        ),
        child: SizedBox(
          height: size.height,
          width: size.width,
          child: Align(child: SvgPicture.asset(icon)),
        ),
      ),
    );
  }
}
