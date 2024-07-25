import 'dart:ui';

import 'package:ppui_demo/values/app_assets.dart';
import 'package:ppui_demo/values/theme/app_color_theme_extension.dart';

enum BottomBarPages {
  courses('Courses', AppAssets.courses),
  profile('Profile', AppAssets.profile),
  settings('Settings', AppAssets.wheel);

  const BottomBarPages(this.label, this.icon);

  final String label;
  final String icon;

  Color getColor({
    required BottomBarPages selectedPage,
    required AppColorThemeExtension appColor,
  }) {
    return this == selectedPage
        ? appColor.bottomBarItemSelected
        : appColor.bottomBarItem;
  }
}

enum NetworkState {
  idle,
  loading,
  success,
  error;

  bool get isIdle => this == NetworkState.idle;

  bool get isLoading => this == NetworkState.loading;

  bool get isSuccessful => this == NetworkState.success;

  bool get isFailed => this == NetworkState.error;
}
