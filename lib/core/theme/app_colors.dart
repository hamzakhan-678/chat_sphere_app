import 'package:flutter/material.dart';

class AppColors {
  // Dark Mode
  static const Color primaryDark = Color(0xFF2e84ef);

  static const Color backgroundDark = Color(0xFF0b0f17);
  static const Color surfaceDark = Color(0xFF14171f);
  static const Color surfaceBorderDark = Color(0xFF292c33);

  static const Color textPrimaryDark = Color(0xFFEDF1F4);
  static const Color textSecondaryDark = Color(0xFF939CA6);
  static final Color textHintDark = Color(0xFF939CA6).withValues(alpha: 0.3);

  static const Color dividerDark = Color(0xFF21252c);

  // Light Mode
  static const Color primaryLt = Color(0xFF2e84ef);

  static const Color backgroundLt = Color(0xFFffffff);
  static const Color surfaceLt = Color(0xFFE1EBFA);
  static const Color surfaceBorderLt = Color(0xFF292c33);

  static const Color textPrimaryLt = Color(0xFF131922);
  static const Color textSecondaryLt = Color(0xFF939CA6);
  static final Color textHintLt = Color(0xFF939CA6).withValues(alpha: 0.5);

  static const Color dividerLt = Color(0xFF21252c);

  // Common

  static const Color error = Color(0xFFf14d4c);
  static const Color success = Color(0xFF00bc7d);
  static const Color warning = Color(0xFFFFC107);

  // static const Color secondary = Color(
  //   0xFF0087EF,
  // ); // Accent/complement Badges, toggles, highlights

  // static const Color onPrimary = Color(
  //   0xFF939CA6,
  // ); // Text/icon ON primary bgText inside a filled button

  // static const Color onSurface = Color(
  //   0xFF939CA6,
  // ); // Text/icon ON surface bgText inside cards
}
