import 'package:flutter/material.dart';
import 'package:fotowah_cmf/app/core/theme/app_colors.dart';
import 'package:fotowah_cmf/app/core/theme/app_text_theme.dart';

class AppTheme {
  const AppTheme._();

  static ThemeData get light => ThemeData.light().copyWith(
    scaffoldBackgroundColor: AppColors.background,
    colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primary),
    textTheme: AppTextTheme.appTextTheme,
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.transparent,
      foregroundColor: AppColors.text,
      elevation: 0,
      centerTitle: true,
      toolbarHeight: kToolbarHeight * 1.5,
      titleTextStyle: AppTextTheme.appTextTheme.titleLarge,
      actionsPadding: const EdgeInsetsGeometry.directional(end: 8),
      actionsIconTheme: const IconThemeData(
        size: 36,
        color: AppColors.text,
      ),
    ),
  );
}
