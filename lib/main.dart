import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:ppui_demo/models/course.dart';
import 'package:ppui_demo/modules/auth/login_screen.dart';
import 'package:ppui_demo/modules/course/course_detail_screen.dart';
import 'package:ppui_demo/modules/home/home_screen.dart';
import 'package:ppui_demo/utils/extensions.dart';
import 'package:ppui_demo/values/app_routes.dart';
import 'package:ppui_demo/values/app_strings.dart';
import 'package:ppui_demo/values/theme/app_theme.dart';

void main() {
  runApp(
    DevicePreview(
      // enabled: !kReleaseMode,
      enabled: false,
      builder: (_) => const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: context.hideKeyboard,
      child: MaterialApp(
        title: AppStrings.appTitle,
        theme: AppTheme.light,
        initialRoute: AppRoutes.login,
        locale: DevicePreview.locale(context),
        builder: DevicePreview.appBuilder,
        routes: {
          AppRoutes.home: (_) => const HomeScreen(),
          AppRoutes.login: (_) => const LoginScreen(),
          AppRoutes.courseDetail: (context) {
            final args = ModalRoute.of(context)?.settings.arguments;
            return args is Course
                ? CourseDetailScreen(args)
                : const Placeholder();
          },
        },
      ),
    );
  }
}
