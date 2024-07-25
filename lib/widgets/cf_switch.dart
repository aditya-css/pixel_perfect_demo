import 'package:flutter/material.dart';
import 'package:ppui_demo/values/app_assets.dart';
import 'package:ppui_demo/values/app_colors.dart';
import 'package:ppui_demo/values/app_constants.dart';

class CfSwitch extends StatefulWidget {
  const CfSwitch({
    this.initial = true,
    super.key,
  });

  final bool initial;

  @override
  State<CfSwitch> createState() => _CfSwitchState();
}

class _CfSwitchState extends State<CfSwitch> {
  late bool state = widget.initial;

  @override
  void didUpdateWidget(covariant CfSwitch oldWidget) {
    if (mounted && oldWidget.initial != widget.initial) {
      setState(() => state = widget.initial);
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => setState(() => state = !state),
      child: Stack(
        children: [
          AnimatedContainer(
            height: 8,
            width: 32,
            duration: AppConstants.switchAnimDuration,
            margin: const EdgeInsets.symmetric(vertical: 6),
            decoration: BoxDecoration(
              color: state ? AppColors.success : AppColors.gray,
              borderRadius: const BorderRadius.all(Radius.circular(4.5)),
            ),
          ),
          AnimatedPositioned(
            height: 20,
            left: state ? 12 : 0,
            duration: const Duration(milliseconds: 60),
            child: Image.asset(AppAssets.thumb, height: 20),
          ),
        ],
      ),
    );
  }
}
