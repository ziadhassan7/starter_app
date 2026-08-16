import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class AppColors {
  static bool isDark = false;

  /// Call this before rebuilding the tree on theme change
  static void setGlobalTheme({required ThemeMode themeMode}) {
    switch(themeMode){
      case ThemeMode.light:
        isDark = false;
        break;
      case ThemeMode.dark:
        isDark = true;
        break;
      case ThemeMode.system:
        var brightness = SchedulerBinding.instance.platformDispatcher.platformBrightness;
        isDark = (brightness == Brightness.dark);
        break;
    }
  }

  // --- Base colors ---
  static Color get background => isDark ? backgroundDark : backgroundLight;
  static Color get foreground => isDark ? foregroundDark : foregroundLight;
  static Color get primary => isDark ? primaryDark : primaryLight;
  static Color get secondary => isDark ? secondaryDark : secondaryLight;
  static Color get text => isDark ? textDark : textLight;

  // --- Raw palette ---
  static const backgroundLight = Color(0xFFEBEBEB);
  static const backgroundDark = Color(0xFF292929);

  static const foregroundLight = Color(0xFFFFFFFF);
  static const foregroundDark = Color(0xFF434343);

  static const primaryLight = Color(0xFF28997F);
  static const primaryDark = Color(0xFFAADB8B);

  static const secondaryLight = Color(0xFF1E6E52);
  static const secondaryDark = Color(0xFFC9D1B0);

  static const textLight = Color(0xFF000000);
  static const textDark = Color(0xFFFFFFFF);

  static const focused = Colors.black87;
  static const unFocused = Colors.black45;

}

// we use a static getter to dynamically get the correct color value
// instead of storing a static variable in memory.