import 'package:flutter/material.dart';
import 'package:ppui_demo/values/theme/app_color_theme_extension.dart';
import 'package:ppui_demo/values/theme/app_text_theme_extension.dart';

extension BuildContextExtension on BuildContext {
  Future<T?> push<T extends Object?>(
    String name, {
    Object? arguments,
  }) {
    return Navigator.pushNamed(this, name, arguments: arguments);
  }

  void pop<T>([T? result]) => Navigator.pop(this, result);

  void hideKeyboard() {
    final currentFocus = FocusScope.of(this);
    if (!currentFocus.hasPrimaryFocus) {
      currentFocus.focusedChild?.unfocus();
    }
  }

  double height([double fraction = 1]) =>
      MediaQuery.sizeOf(this).height * fraction;

  double width([double fraction = 1]) =>
      MediaQuery.sizeOf(this).width * fraction;

  ThemeData get theme => Theme.of(this);

  AppColorThemeExtension get appColor {
    return Theme.of(this).extension<AppColorThemeExtension>() ??
        const AppColorThemeExtension();
  }

  AppTextThemeExtension get appTextTheme {
    return Theme.of(this).extension<AppTextThemeExtension>() ??
        const AppTextThemeExtension();
  }
}

extension DurationExtensions on Duration {
  String toOneCharSuffix() {
    final days = inDays;
    final hours = inHours.remainder(24);
    final minutes = inMinutes.remainder(60);
    final seconds = inSeconds.remainder(60);
    final milli = inMilliseconds.remainder(1000);
    final micro = inMicroseconds.remainder(1000);

    return [
      if (days > 0) '$days d',
      if (hours > 0) '$hours h',
      if (minutes > 0) '$minutes min',
      if (seconds > 0) '$seconds sec',
      if (milli > 0) '$milli ms',
      if (micro > 0) '$micro us',
    ].join(' ');
  }
}
