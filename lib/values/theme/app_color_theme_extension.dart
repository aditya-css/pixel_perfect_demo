import 'package:flutter/material.dart';
import 'package:ppui_demo/values/app_colors.dart';

final class AppColorThemeExtension
    extends ThemeExtension<AppColorThemeExtension> {
  const AppColorThemeExtension({
    this.scaffoldBg = AppColors.white,
    this.iconBgBtn = AppColors.secondary,
    this.filledBtnBg = AppColors.primary,
    this.filledBtnText = AppColors.dark,
    this.textBtnText = AppColors.darkGray,
    this.hintText = AppColors.darkGray,
    this.roundOutline = AppColors.gray,
    this.chipBg = AppColors.secondary,
    this.chipBorder = AppColors.transparent,
    this.duration = AppColors.success,
    this.bottomBarItem = AppColors.gray,
    this.bottomBarItemSelected = AppColors.primary,
    this.courseCardBorder = AppColors.gray,
    this.courseCardBg = AppColors.lightGray,
    this.courseCardDescText = AppColors.dark,
    this.textBorderBtnBorder = AppColors.gray,
    this.actionTileBorder = AppColors.gray,
    this.coursePriceText = AppColors.white,
    this.appBarTitle = AppColors.dark,
    this.courseDetailText = AppColors.dark,
    this.pillContentText = AppColors.white,
    this.profileBg = AppColors.lightGray,
    this.profileBorder = AppColors.secondary,
  });

  final Color scaffoldBg;
  final Color iconBgBtn;
  final Color filledBtnBg;
  final Color filledBtnText;
  final Color textBtnText;
  final Color hintText;
  final Color roundOutline;
  final Color chipBg;
  final Color chipBorder;
  final Color duration;
  final Color bottomBarItem;
  final Color bottomBarItemSelected;
  final Color courseCardBorder;
  final Color courseCardBg;
  final Color courseCardDescText;
  final Color textBorderBtnBorder;
  final Color actionTileBorder;
  final Color coursePriceText;
  final Color appBarTitle;
  final Color courseDetailText;
  final Color pillContentText;
  final Color profileBg;
  final Color profileBorder;

  @override
  ThemeExtension<AppColorThemeExtension> copyWith() {
    throw UnimplementedError();
  }

  @override
  ThemeExtension<AppColorThemeExtension> lerp(
    covariant ThemeExtension<AppColorThemeExtension>? other,
    double t,
  ) {
    throw UnimplementedError();
  }
}
