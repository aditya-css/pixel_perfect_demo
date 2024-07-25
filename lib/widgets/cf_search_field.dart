import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ppui_demo/values/app_assets.dart';
import 'package:ppui_demo/values/app_constants.dart';
import 'package:ppui_demo/values/app_number_constants.dart';
import 'package:ppui_demo/values/app_strings.dart';

import 'cf_text_field.dart';

class CfSearchField extends StatefulWidget {
  const CfSearchField({
    this.controller,
    this.hint = AppStrings.searchCourse,
    this.onChange,
    this.onClear,
    super.key,
  });

  final String hint;
  final TextEditingController? controller;
  final ValueSetter<String>? onChange;
  final VoidCallback? onClear;

  @override
  State<CfSearchField> createState() => _CfSearchFieldState();
}

class _CfSearchFieldState extends State<CfSearchField> {
  late final controller = widget.controller ?? TextEditingController();
  final shouldShowClearIcon = ValueNotifier(false);

  @override
  void initState() {
    super.initState();
    controller.addListener(changeSuffixIconOnTextChange);
  }

  @override
  Widget build(BuildContext context) {
    return CfTextField(
      hint: widget.hint,
      controller: controller,
      onChange: widget.onChange,
      textInputAction: TextInputAction.search,
      suffixIcon: ValueListenableBuilder(
        valueListenable: shouldShowClearIcon,
        builder: (context, showClear, searchIcon) {
          return AnimatedSwitcher(
            duration: AppConstants.searchIconCloseAnimDuration,
            child: showClear
                ? IconButton(
                    onPressed: () {
                      controller.text = AppStrings.emptyString;
                      widget.onClear?.call();
                    },
                    padding: EdgeInsets.zero,
                    icon: const Icon(Icons.cancel_outlined),
                  )
                : searchIcon,
          );
        },
        child: Padding(
          padding: const EdgeInsets.only(
            right: 16,
          ),
          child: SvgPicture.asset(AppAssets.search),
        ),
      ),
    );
  }

  @override
  void dispose() {
    controller.removeListener(changeSuffixIconOnTextChange);
    if (widget.controller == null) controller.dispose();
    super.dispose();
  }

  void changeSuffixIconOnTextChange() {
    final showSuffixIcon = controller.text.trim().isNotEmpty;
    if (showSuffixIcon == shouldShowClearIcon.value) return;
    shouldShowClearIcon.value = showSuffixIcon;
  }
}
