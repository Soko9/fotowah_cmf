import 'package:flutter/material.dart';
import 'package:fotowah_cmf/app/core/theme/app_colors.dart';
import 'package:fotowah_cmf/app/core/theme/app_text_theme.dart';

class AppTheme {
  const AppTheme._();

  static ThemeData get light => ThemeData.light().copyWith(
    scaffoldBackgroundColor: AppColors.background,
    colorScheme: ColorScheme.fromSeed(seedColor: AppColors.muted),
    textTheme: AppTextTheme.appTextTheme,
  );
}
