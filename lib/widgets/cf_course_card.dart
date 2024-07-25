import 'package:flutter/material.dart';
import 'package:ppui_demo/models/course.dart';
import 'package:ppui_demo/utils/extensions.dart';
import 'package:ppui_demo/values/app_assets.dart';
import 'package:ppui_demo/values/app_colors.dart';
import 'package:ppui_demo/values/app_constants.dart';
import 'package:ppui_demo/values/app_number_constants.dart';
import 'package:ppui_demo/values/app_routes.dart';
import 'package:ppui_demo/widgets/cf_pill.dart';

class CfCourseCard extends StatelessWidget {
  const CfCourseCard(this.course, {super.key});

  final Course course;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => context.push(
        AppRoutes.courseDetail,
        arguments: course,
      ),
      child: DecoratedBox(
        decoration: BoxDecoration(
          border: Border.all(color: context.appColor.courseCardBorder),
          borderRadius: const BorderRadius.all(
            Radius.circular(8),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              decoration: BoxDecoration(
                color: context.appColor.courseCardBg,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(8),
                  topRight: Radius.circular(8),
                ),
              ),
              margin: const EdgeInsets.fromLTRB(1, 1, 1, 0),
              padding: const EdgeInsets.fromLTRB(15, 15, 15, 8),
              height: AppNumberConstants.courseCardUpperHeight,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Flexible(
                    child: Image.asset(
                      course.artwork ?? AppAssets.course1,
                    ),
                  ),
                  const SizedBox(height: 8),
                  if (course.price != null)
                    Align(
                      alignment: Alignment.bottomRight,
                      child: CfPill(
                        content: '\$ ${course.price}',
                        contentStyle: context.appTextTheme.buttonSmall.copyWith(
                          color: context.appColor.coursePriceText,
                        ),
                        padding: const EdgeInsets.symmetric(
                          vertical: 4,
                          horizontal: 16,
                        ),
                      ),
                    ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (course.duration != null)
                    Text(
                      course.duration!.toOneCharSuffix(),
                      maxLines: AppNumberConstants.courseDurationMaxLines,
                      overflow: TextOverflow.fade,
                      style: context.appTextTheme.paragraphSmall.copyWith(
                        color: context.appColor.duration,
                      ),
                    ),
                  const SizedBox(height: 4),
                  Text(
                    course.title ?? '',
                    maxLines: AppNumberConstants.courseTitleMaxLines,
                    overflow: TextOverflow.ellipsis,
                    style: context.appTextTheme.h4,
                  ),
                  const SizedBox(height: 4),
                  if (course.subtitle != null)
                    Text(
                      course.subtitle!,
                      maxLines: AppNumberConstants.courseDetailMaxLines,
                      overflow: TextOverflow.ellipsis,
                      style: context.appTextTheme.paragraphMedium
                          .copyWith(color: context.appColor.courseCardDescText),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
