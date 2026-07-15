import 'package:flutter/material.dart';

class AppColors {
  static bool isDark = false;

  /// Call this before rebuilding the tree on theme change
  static void setGlobalTheme({required bool isDarkTheme}) {
    isDark = isDarkTheme;
  }

  // --- Base colors ---
  static Color get background => isDark ? backgroundDark : backgroundLight;
  static Color get primary => isDark ? primaryDark : primaryLight;
  static Color get text => isDark ? textDark : textLight;

  // --- Raw palette ---
  static const backgroundLight = Color(0xFFEBEBEB);
  static const backgroundDark = Color(0xFF292929);

  static const primaryLight = Color(0xFF28997F);
  static const primaryDark = Color(0xFFAADB8B);

  static const textLight = Color(0xFF000000);
  static const textDark = Color(0xFFFFFFFF);
}