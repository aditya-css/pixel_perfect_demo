import 'package:flutter/material.dart';
import 'package:ppui_demo/utils/extensions.dart';
import 'package:ppui_demo/values/app_constants.dart';
import 'package:ppui_demo/values/app_number_constants.dart';

class CfTextBorderButton extends StatelessWidget {
  const CfTextBorderButton({
    super.key,
    required this.title,
    this.margin = const EdgeInsets.only(bottom: 16),
    this.padding = const EdgeInsets.symmetric(
      horizontal: 15,
      vertical: 23,
    ),
    this.style,
  });

  final String title;
  final TextStyle? style;
  final EdgeInsets margin;
  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(
          Radius.circular(16),
        ),
        border: Border.fromBorderSide(
          BorderSide(color: context.appColor.textBorderBtnBorder),
        ),
      ),
      padding: padding,
      margin: margin,
      alignment: Alignment.center,
      child: Text(
        title,
        overflow: TextOverflow.ellipsis,
        style: style ?? context.appTextTheme.h4,
        maxLines: AppNumberConstants.textBorderBtnMaxLines,
      ),
    );
  }
}
