import 'package:flutter/material.dart';
import '../app_colors.dart';
import '../app_spacing.dart';
import '../app_typography.dart';

class MaterialTheme {
  static ThemeData build() {
    return ThemeData(
      colorScheme: ColorScheme(
        primary: AppColors.primary,
        primaryContainer: AppColors.primary.withOpacity(0.1),
        secondary: Colors.green,
        secondaryContainer: Colors.green.withOpacity(0.1),
        surface: Colors.white,
        error: Colors.red,
        onPrimary: Colors.white,
        onSecondary: Colors.white,
        onSurface: AppColors.textPrimary,
        onError: Colors.white,
        brightness: Brightness.light,
      ),
      scaffoldBackgroundColor: AppColors.background,
      textTheme: TextTheme(
        displayLarge: AppTypography.title,
        bodyMedium: TextStyle(fontSize: 16, color: AppColors.textPrimary),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.all(AppSpacing.m),
          textStyle: const TextStyle(fontSize: 16),
        ),
      ),
      useMaterial3: true,
    );
  }
}