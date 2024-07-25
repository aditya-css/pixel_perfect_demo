import 'dart:io';

import 'package:flutter/material.dart';
import 'package:ppui_demo/values/app_colors.dart';
import 'package:ppui_demo/values/app_constants.dart';
import 'package:ppui_demo/values/app_number_constants.dart';
import 'package:ppui_demo/values/theme/app_color_theme_extension.dart';
import 'package:ppui_demo/values/theme/app_text_theme_extension.dart';

final class AppTheme {
  const AppTheme._();

  static final ThemeData light = ThemeData(
    fontFamily: AppConstants.fontFamily,
    brightness: Brightness.light,
    highlightColor: Platform.isIOS ? AppColors.transparent : null,
    splashColor: Platform.isIOS ? AppColors.transparent : null,
    splashFactory: Platform.isIOS ? NoSplash.splashFactory : null,
    extensions: const [
      _lightColorExtension,
      _lightTextExtension,
    ],
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: const EdgeInsets.all(16),
      hintStyle: _lightTextExtension.paragraphMedium.copyWith(
        color: _lightColorExtension.hintText,
      ),
      enabledBorder: const OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.gray),
        borderRadius: BorderRadius.all(
          Radius.circular(12),
        ),
      ),
      disabledBorder: const OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.gray),
        borderRadius: BorderRadius.all(
          Radius.circular(12),
        ),
      ),
      focusedBorder: const OutlineInputBorder(
        borderSide: BorderSide(
          color: AppColors.darkGray,
          width: 2,
        ),
        borderRadius: BorderRadius.all(
          Radius.circular(12),
        ),
      ),
      errorBorder: const OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.error),
        borderRadius: BorderRadius.all(
          Radius.circular(12),
        ),
      ),
    ),
    filledButtonTheme: FilledButtonThemeData(
      style: ButtonStyle(
        backgroundColor:
        WidgetStatePropertyAll(_lightColorExtension.filledBtnBg),
        textStyle: WidgetStatePropertyAll(
          _lightTextExtension.buttonMedium.copyWith(
            color: _lightColorExtension.filledBtnText,
          ),
        ),
        padding: const WidgetStatePropertyAll(
          EdgeInsets.symmetric(
            vertical: 19,
            horizontal: 32,
          ),
        ),
        shape: const WidgetStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(16),
            ),
          ),
        ),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
        foregroundColor: WidgetStatePropertyAll(
          _lightColorExtension.textBtnText,
        ),
        textStyle: WidgetStatePropertyAll(_lightTextExtension.buttonSmall),
      ),
    ),
  );

  static const _lightColorExtension = AppColorThemeExtension();
  static const _lightTextExtension = AppTextThemeExtension();
}
