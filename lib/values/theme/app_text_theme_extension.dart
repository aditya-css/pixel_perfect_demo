import 'package:flutter/material.dart';
import 'package:ppui_demo/values/app_colors.dart';
import 'package:ppui_demo/values/app_constants.dart';

final class AppTextThemeExtension
    extends ThemeExtension<AppTextThemeExtension> {
  const AppTextThemeExtension({
    this.h1 = const TextStyle(
      fontSize: 56,
      fontWeight: FontWeight.bold,
      letterSpacing: -1,
      height: 1.05,
      fontFamily: AppConstants.fontFamily,
    ),
    this.h2 = const TextStyle(
      fontSize: 40,
      fontWeight: FontWeight.bold,
      letterSpacing: -1,
      height: 1.15,
      fontFamily: AppConstants.fontFamily,
    ),
    this.h3 = const TextStyle(
      fontSize: 32,
      fontWeight: FontWeight.bold,
      letterSpacing: -1,
      height: 1.3125,
      color: AppColors.c333333,
      fontFamily: AppConstants.fontFamily,
    ),
    this.h4 = const TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.w500,
      letterSpacing: -0.5,
      height: 1.33,
      color: AppColors.dark,
      fontFamily: AppConstants.fontFamily,
    ),
    this.h5 = const TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w500,
      letterSpacing: -0.5,
      height: 1.3,
      fontFamily: AppConstants.fontFamily,
    ),
    this.paragraphLarge = const TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.normal,
      letterSpacing: -0.5,
      height: 1.625,
      color: AppColors.dark,
      fontFamily: AppConstants.fontFamily,
    ),
    this.paragraphMedium = const TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.normal,
      height: 1.5,
      letterSpacing: -0.02,
      color: AppColors.darkGray,
      fontFamily: AppConstants.fontFamily,
    ),
    this.paragraphSmall = const TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w500,
      height: 1.5,
      letterSpacing: -0.02,
      fontFamily: AppConstants.fontFamily,
    ),
    this.buttonLarge = const TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w500,
      letterSpacing: -0.5,
      height: 1.222,
      fontFamily: AppConstants.fontFamily,
    ),
    this.buttonMedium = const TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w500,
      height: 1.125,
      fontFamily: AppConstants.fontFamily,
    ),
    this.buttonSmall = const TextStyle(
      fontSize: 14,
      color: AppColors.darkGray,
      fontWeight: FontWeight.w500,
      height: 1.1429,
      fontFamily: AppConstants.fontFamily,
    ),
  });

  final TextStyle h1;
  final TextStyle h2;
  final TextStyle h3;
  final TextStyle h4;
  final TextStyle h5;
  final TextStyle paragraphLarge;
  final TextStyle paragraphMedium;
  final TextStyle paragraphSmall;
  final TextStyle buttonLarge;
  final TextStyle buttonMedium;
  final TextStyle buttonSmall;

  @override
  AppTextThemeExtension copyWith({
    TextStyle? h1,
    TextStyle? h2,
    TextStyle? h3,
    TextStyle? h4,
    TextStyle? h5,
    TextStyle? paragraphLarge,
    TextStyle? paragraphMedium,
    TextStyle? paragraphSmall,
    TextStyle? buttonLarge,
    TextStyle? buttonMedium,
    TextStyle? buttonSmall,
  }) {
    return AppTextThemeExtension(
      h1: h1 ?? this.h1,
      h2: h2 ?? this.h2,
      h3: h3 ?? this.h3,
      h4: h4 ?? this.h4,
      h5: h5 ?? this.h5,
      paragraphLarge: paragraphLarge ?? this.paragraphLarge,
      paragraphMedium: paragraphMedium ?? this.paragraphMedium,
      paragraphSmall: paragraphSmall ?? this.paragraphSmall,
      buttonLarge: buttonLarge ?? this.buttonLarge,
      buttonMedium: buttonMedium ?? this.buttonMedium,
      buttonSmall: buttonSmall ?? this.buttonSmall,
    );
  }

  @override
  AppTextThemeExtension lerp(
    covariant AppTextThemeExtension? other,
    double t,
  ) {
    return AppTextThemeExtension(
      h1: TextStyle.lerp(h1, other?.h1, t) ?? h1,
      h2: TextStyle.lerp(h2, other?.h2, t) ?? h2,
      h3: TextStyle.lerp(h3, other?.h3, t) ?? h3,
      h4: TextStyle.lerp(h4, other?.h4, t) ?? h4,
      h5: TextStyle.lerp(h5, other?.h5, t) ?? h5,
      paragraphLarge: TextStyle.lerp(
            paragraphLarge,
            other?.paragraphLarge,
            t,
          ) ??
          paragraphLarge,
      paragraphMedium: TextStyle.lerp(
            paragraphMedium,
            other?.paragraphMedium,
            t,
          ) ??
          paragraphMedium,
      paragraphSmall: TextStyle.lerp(
            paragraphSmall,
            other?.paragraphSmall,
            t,
          ) ??
          paragraphSmall,
      buttonLarge: TextStyle.lerp(
            buttonLarge,
            other?.buttonLarge,
            t,
          ) ??
          buttonLarge,
      buttonMedium: TextStyle.lerp(
            buttonMedium,
            other?.buttonMedium,
            t,
          ) ??
          buttonMedium,
      buttonSmall: TextStyle.lerp(
            buttonSmall,
            other?.buttonSmall,
            t,
          ) ??
          buttonSmall,
    );
  }
}
