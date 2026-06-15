import 'package:chat_sphere_app/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData get darkTheme => ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: AppColors.backgroundDark,
    dividerColor: AppColors.dividerDark,
    colorScheme: ColorScheme.dark(
      primary: AppColors.primaryDark,
      onPrimary: Colors.white,
      surface: AppColors.surfaceDark,
      onSurface: AppColors.textPrimaryDark,
      onSurfaceVariant: AppColors.textSecondaryDark,
      shadow: AppColors.textSecondaryDark.withValues(alpha: 0.4),
      outline: AppColors.surfaceBorderDark,
    ),
  );

  static ThemeData get lightTheme => ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: AppColors.backgroundLt,
    dividerColor: AppColors.dividerLt,
    colorScheme: ColorScheme.light(
      primary: AppColors.primaryLt,
      onPrimary: Colors.white,
      surface: AppColors.surfaceLt,
      onSurface: AppColors.textPrimaryLt,
      onSurfaceVariant: AppColors.textSecondaryLt,
      shadow: AppColors.textSecondaryLt.withValues(alpha: 0.2),
      outline: AppColors.surfaceBorderLt,
    ),
  );
}
