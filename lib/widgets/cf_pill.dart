import 'package:flutter/material.dart';
import 'package:ppui_demo/utils/extensions.dart';
import 'package:ppui_demo/values/app_number_constants.dart';

class CfPill extends StatelessWidget {
  const CfPill({
    required this.content,
    this.padding = const EdgeInsets.symmetric(
      vertical: 3,
      horizontal: 11,
    ),
    this.contentStyle,
    this.background,
    super.key,
  });

  final String content;
  final EdgeInsets padding;
  final TextStyle? contentStyle;
  final Color? background;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      decoration: BoxDecoration(
        color: background ?? context.appColor.chipBg,
        borderRadius: const BorderRadius.all(Radius.circular(12)),
      ),
      child: Text(
        content,
        overflow: TextOverflow.fade,
        maxLines: AppNumberConstants.pillMaxLines,
        style: contentStyle ??
            context.appTextTheme.paragraphSmall
                .copyWith(color: context.appColor.pillContentText),
      ),
    );
  }
}
