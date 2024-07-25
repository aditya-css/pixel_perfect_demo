import 'package:flutter/material.dart';
import 'package:ppui_demo/utils/extensions.dart';
import 'package:ppui_demo/values/app_colors.dart';
import 'package:ppui_demo/values/app_number_constants.dart';

class CfCourseDetailSection extends StatelessWidget {
  const CfCourseDetailSection({
    required this.title,
    required this.body,
    this.titleStyle,
    super.key,
  });

  final String title;
  final String body;
  final TextStyle? titleStyle;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 16),
        Text(
          title,
          style: (titleStyle ?? context.appTextTheme.h4)
              .copyWith(color: context.appColor.courseDetailText),
        ),
        const SizedBox(height: 4),
        Text(
          body,
          style: context.appTextTheme.paragraphMedium
              .copyWith(color: context.appColor.courseDetailText),
        ),
      ],
    );
  }
}
