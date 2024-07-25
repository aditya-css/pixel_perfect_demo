import 'package:flutter/material.dart';
import 'package:ppui_demo/utils/extensions.dart';

class CfTextButton extends StatelessWidget {
  const CfTextButton(
    this.title, {
    required this.onTap,
    this.padding,
    super.key,
  });

  final String title;
  final VoidCallback onTap;
  final EdgeInsets? padding;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onTap,
      style: padding == null
          ? null
          : (context.theme.textButtonTheme.style?.copyWith(
              padding: WidgetStatePropertyAll(padding),
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            )),
      child: Text(title),
    );
  }
}
