import 'package:flutter/material.dart';

class CfFilledButton extends StatelessWidget {
  const CfFilledButton(
    this.title, {
    required this.onTap,
    this.titleStyle,
    this.maxWidth,
    this.padding,
    super.key,
  });

  final String title;
  final VoidCallback onTap;
  final TextStyle? titleStyle;
  final double? maxWidth;
  final EdgeInsets? padding;

  @override
  Widget build(BuildContext context) {
    final text = Text(
      title,
      style: titleStyle,
      maxLines: 1,
      overflow: TextOverflow.fade,
    );
    return Align(
      child: SizedBox(
        width: maxWidth ?? double.maxFinite,
        child: FilledButton(
          onPressed: onTap,
          child: padding == null
              ? text
              : Padding(
                  padding: padding!,
                  child: text,
                ),
        ),
      ),
    );
  }
}
