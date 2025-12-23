import 'package:flutter/material.dart';
import 'package:fotowah_cmf/app/core/theme/app_colors.dart';

class AppTextTheme {
  const AppTextTheme._();

  static String get _fontFamily => 'Beiruti';
  static Color get _textColor => AppColors.text;

  static TextStyle get _root => TextStyle(
    fontFamily: _fontFamily,
    color: _textColor,
  );

  static final TextStyle _display = _root.copyWith(fontWeight: FontWeight.w800);
  static final TextStyle _headline = _root.copyWith(
    fontWeight: FontWeight.w700,
  );
  static final TextStyle _title = _root.copyWith(fontWeight: FontWeight.w600);
  static final TextStyle _body = _root.copyWith(fontWeight: FontWeight.w500);
  static final TextStyle _label = _root.copyWith(fontWeight: FontWeight.w300);

  static TextTheme get appTextTheme => TextTheme(
    displayLarge: _display.copyWith(fontSize: 42),
    displayMedium: _display.copyWith(fontSize: 36),
    displaySmall: _display.copyWith(fontSize: 24),
    headlineLarge: _headline.copyWith(fontSize: 38),
    headlineMedium: _headline.copyWith(fontSize: 28),
    headlineSmall: _headline.copyWith(fontSize: 22),
    titleLarge: _title.copyWith(fontSize: 32),
    titleMedium: _title.copyWith(fontSize: 26),
    titleSmall: _title.copyWith(fontSize: 18),
    bodyLarge: _body.copyWith(fontSize: 28),
    bodyMedium: _body.copyWith(fontSize: 22),
    bodySmall: _body.copyWith(fontSize: 16),
    labelLarge: _label.copyWith(fontSize: 24),
    labelMedium: _label.copyWith(fontSize: 18),
    labelSmall: _label.copyWith(fontSize: 12),
  );
}
