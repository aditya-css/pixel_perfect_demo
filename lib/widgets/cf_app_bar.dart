import 'package:flutter/material.dart';
import 'package:ppui_demo/utils/extensions.dart';
import 'package:ppui_demo/values/app_number_constants.dart';

class CfAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CfAppBar({
    required this.title,
    this.leading,
    this.titleStyle,
    this.actions,
    super.key,
  });

  final Widget? leading;
  final String title;
  final TextStyle? titleStyle;
  final List<Widget>? actions;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Row(
        children: [
          Flexible(
            child: Align(
              alignment: Alignment.centerLeft,
              child: leading,
            ),
          ),
          Expanded(
            child: Text(
              title,
              textAlign: TextAlign.center,
              maxLines: AppNumberConstants.appBarTitleMaxLines,
              overflow: TextOverflow.fade,
              style: titleStyle ??
                  context.appTextTheme.h4.copyWith(
                    color: context.appColor.appBarTitle,
                  ),
            ),
          ),
          const Spacer(),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(
        AppNumberConstants.appBarHeight - 5,
      );
}
