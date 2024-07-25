import 'package:flutter/material.dart';
import 'package:ppui_demo/models/course.dart';
import 'package:ppui_demo/utils/debouncer.dart';
import 'package:ppui_demo/utils/enumerations.dart';
import 'package:ppui_demo/utils/extensions.dart';
import 'package:ppui_demo/values/app_assets.dart';
import 'package:ppui_demo/values/app_number_constants.dart';
import 'package:ppui_demo/values/app_strings.dart';
import 'package:ppui_demo/widgets/cf_course_card.dart';
import 'package:ppui_demo/widgets/cf_error_view.dart';
import 'package:ppui_demo/widgets/cf_pill.dart';
import 'package:ppui_demo/widgets/cf_round_outline_button.dart';
import 'package:ppui_demo/widgets/cf_search_field.dart';
import 'package:skeletonizer/skeletonizer.dart';

class CourseScreen extends StatefulWidget {
  const CourseScreen({super.key});

  @override
  State<CourseScreen> createState() => _CourseScreenState();
}

class _CourseScreenState extends State<CourseScreen> {
  static const _categories = ['CSS', 'UX', 'Swift', 'UI', 'Dart', 'Flutter'];

  String? searchCriteria;
  List<Course>? processedCategories;
  final debouncer = Debouncer(1000);
  var searchState = NetworkState.idle;

  List<Course> get courses =>
      processedCategories == null ? courseList : processedCategories!;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
      ),
      child: Column(
        children: [
          const SizedBox(height: 8),
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      AppStrings.helloComma,
                      overflow: TextOverflow.ellipsis,
                      style: context.appTextTheme.paragraphLarge,
                      maxLines: AppNumberConstants.courseGreetMaxLines,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      AppStrings.userName,
                      overflow: TextOverflow.ellipsis,
                      style: context.appTextTheme.h3,
                      maxLines: AppNumberConstants.userNameCourseMaxLines,
                    ),
                  ],
                ),
              ),
              CfRoundOutlineButton(
                icon: AppAssets.bell,
                onTap: () {},
              ),
            ],
          ),
          const SizedBox(height: 12),
          CfSearchField(
            onChange: onCourseSearch,
            onClear: onSearchClear,
          ),
          const SizedBox(height: 12),
          SizedBox(
            height: AppNumberConstants.courseCategoriesHeight,
            child: ListView.separated(
              clipBehavior: Clip.none,
              scrollDirection: Axis.horizontal,
              itemCount: _categories.length,
              padding: EdgeInsets.zero,
              separatorBuilder: (_, __) => const SizedBox(
                width: 16,
              ),
              itemBuilder: (_, index) => CfPill(
                // TODO: sprintf
                content: '#${_categories[index]}',
              ),
            ),
          ),
          const SizedBox(height: 8),
          Expanded(
            child: Skeletonizer(
              enabled: searchState.isLoading,
              enableSwitchAnimation: true,
              child: AnimatedSwitcher(
                duration: const Duration(milliseconds: 300),
                child: courses.isEmpty
                    ? const CfErrorView(
                        title: AppStrings.courseNotFound,
                        description: AppStrings.courseNotFoundDesc,
                      )
                    : ListView.separated(
                        keyboardDismissBehavior:
                            ScrollViewKeyboardDismissBehavior.onDrag,
                        itemCount: courses.length,
                        padding: const EdgeInsets.only(
                          top: 12,
                          bottom: 16,
                        ),
                        separatorBuilder: (_, __) => const SizedBox(
                          height: 16,
                        ),
                        itemBuilder: (_, index) => CfCourseCard(
                          courses[index],
                        ),
                      ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void onSearchClear() {
    setState(() => searchCriteria = processedCategories = null);
  }

  void onCourseSearch(String search) {
    final processedSearch = search.trim();
    if (processedSearch == searchCriteria) {
      return;
    }
    searchCriteria = processedSearch;
    if (!searchState.isLoading) {
      setState(() => searchState = NetworkState.loading);
    }
    debouncer.run(
      () {
        if (processedSearch.isEmpty && (searchCriteria?.isNotEmpty ?? false)) {
          if (mounted) {
            setState(() {
              processedCategories = null;
              searchState = NetworkState.idle;
            });
          }
        } else {
          if (mounted) {
            setState(() {
              searchCriteria = processedSearch;
              processedCategories = courseList.where((value) {
                return value.title
                    .toString()
                    .trim()
                    .toLowerCase()
                    .contains(searchCriteria!.toLowerCase());
              }).toList();
              searchState = NetworkState.success;
            });
          }
        }
      },
    );
  }
}
