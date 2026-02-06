import 'package:flutter/material.dart';
import 'app_colors.dart';

class AppTheme {
  static ThemeData material() {
    return ThemeData(
      colorSchemeSeed: AppColors.primary,
      scaffoldBackgroundColor: AppColors.background,
      useMaterial3: true,
    );
  }
}