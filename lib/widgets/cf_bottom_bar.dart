import 'package:flutter/material.dart';
import 'package:ppui_demo/utils/enumerations.dart';
import 'package:ppui_demo/utils/extensions.dart';
import 'package:ppui_demo/values/app_number_constants.dart';
import 'package:ppui_demo/widgets/cf_bottom_bar_item.dart';

class CfBottomBar extends StatefulWidget {
  const CfBottomBar({super.key, required this.onChange});

  final ValueSetter<BottomBarPages> onChange;

  @override
  State<CfBottomBar> createState() => _CfBottomBarState();
}

class _CfBottomBarState extends State<CfBottomBar> {
  var selectedPage = BottomBarPages.courses;

  @override
  Widget build(BuildContext context) {
    final appColor = context.appColor;
    final borderSide = BorderSide(color: context.appColor.hintText);
    final safeArea = MediaQuery.paddingOf(context).bottom;
    return Container(
      padding: EdgeInsets.only(
        top: 8,
        bottom: safeArea == 0 ? 10 : 29,
      ),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
        border: Border(top: borderSide, left: borderSide, right: borderSide),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          CfBottomBarItem(
            page: BottomBarPages.courses,
            color: BottomBarPages.courses.getColor(
              selectedPage: selectedPage,
              appColor: appColor,
            ),
            onTap: () => _onChange(BottomBarPages.courses),
          ),
          CfBottomBarItem(
            page: BottomBarPages.profile,
            color: BottomBarPages.profile.getColor(
              selectedPage: selectedPage,
              appColor: appColor,
            ),
            onTap: () => _onChange(BottomBarPages.profile),
          ),
          CfBottomBarItem(
            page: BottomBarPages.settings,
            color: BottomBarPages.settings.getColor(
              selectedPage: selectedPage,
              appColor: appColor,
            ),
            onTap: () => _onChange(BottomBarPages.settings),
          ),
        ],
      ),
    );
  }

  void _onChange(BottomBarPages page) {
    if (selectedPage == page) return;
    widget.onChange(page);
    setState(() => selectedPage = page);
  }
}
