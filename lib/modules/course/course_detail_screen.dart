import 'package:flutter/material.dart';
import 'package:ppui_demo/models/course.dart';
import 'package:ppui_demo/utils/extensions.dart';
import 'package:ppui_demo/widgets/cf_app_bar.dart';
import 'package:ppui_demo/widgets/cf_course_detail_section.dart';
import 'package:ppui_demo/widgets/cf_filled_button.dart';
import 'package:ppui_demo/widgets/cf_pill.dart';
import 'package:ppui_demo/widgets/cf_round_outline_button.dart';
import 'package:ppui_demo/widgets/cf_scaffold.dart';

class CourseDetailScreen extends StatelessWidget {
  const CourseDetailScreen(this.course, {super.key});

  final Course course;

  @override
  Widget build(BuildContext context) {
    return CfScaffold(
      appBar: CfAppBar(
        title: course.title ?? 'Course',
        leading: CfRoundOutlineButton.back(context),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                keyboardDismissBehavior:
                    ScrollViewKeyboardDismissBehavior.onDrag,
                padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    if (course.artwork != null)
                      SizedBox(
                        height: context.height(0.3165),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 14),
                          child: Image.asset(course.artwork!),
                        ),
                      ),
                    if (course.price != null) ...[
                      const SizedBox(height: 32),
                      Align(
                        alignment: Alignment.centerRight,
                        child: CfPill(
                          content: '\$ ${course.price}',
                          contentStyle:
                              context.appTextTheme.buttonSmall.copyWith(
                            color: context.appColor.coursePriceText,
                          ),
                          padding: const EdgeInsets.symmetric(
                            vertical: 4,
                            horizontal: 16,
                          ),
                        ),
                      ),
                    ],
                    const SizedBox(height: 8),
                    CfCourseDetailSection(
                      title: 'About the course',
                      body: course.description ?? course.subtitle!,
                    ),
                    const SizedBox(height: 8),
                    CfCourseDetailSection(
                      title: 'Duration',
                      body: course.duration!.toOneCharSuffix(),
                      titleStyle: context.appTextTheme.h5,
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(33, 21, 33, 8),
              child: CfFilledButton(
                'Add to cart',
                onTap: Navigator.of(context).pop,
                padding: const EdgeInsets.symmetric(vertical: 3),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
