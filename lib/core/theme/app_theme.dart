import 'package:flutter/material.dart';

import 'app_colors.dart';

ThemeData appTheme() {
  return ThemeData(
    scaffoldBackgroundColor: AppColors.scaffoldBackground,
    primaryColor: AppColors.purplePrimary,
    colorScheme: const ColorScheme.light(primary: AppColors.purplePrimary),
  );
}
