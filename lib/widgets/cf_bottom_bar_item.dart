import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ppui_demo/utils/enumerations.dart';
import 'package:ppui_demo/utils/extensions.dart';

class CfBottomBarItem extends StatelessWidget {
  const CfBottomBarItem({
    required this.page,
    this.onTap,
    this.color,
    super.key,
  });

  final BottomBarPages page;
  final VoidCallback? onTap;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    final itemColor = color ?? context.appColor.bottomBarItem;
    return InkWell(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 8, 20, 8),
            child: SvgPicture.asset(
              page.icon,
              colorFilter: ColorFilter.mode(
                itemColor,
                BlendMode.srcATop,
              ),
            ),
          ),
          Text(
            page.label,
            maxLines: 1,
            overflow: TextOverflow.fade,
            style: context.appTextTheme.paragraphMedium.copyWith(
              color: itemColor,
            ),
          ),
        ],
      ),
    );
  }
}
