import 'package:flutter/material.dart';
import 'prism_colors.dart';
import 'prism_typography.dart';

class PrismTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      primaryColor: PrismColors.brandDefault,
      scaffoldBackgroundColor: PrismColors.bgLight,
      colorScheme: ColorScheme.fromSeed(
        seedColor: PrismColors.brandDefault,
        primary: PrismColors.brandDefault,
        secondary: PrismColors.brandLight,
        error: PrismColors.error,
        surface: PrismColors.bgCard,
      ),
      textTheme: PrismTypography.lightTextTheme,
      cardTheme: CardThemeData(
        color: PrismColors.bgCard,
        elevation: 0.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(12)),
          side: BorderSide(color: PrismColors.border),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: PrismColors.bgLight,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: PrismColors.border),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: PrismColors.border),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: PrismColors.brandDefault, width: 2),
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      ),
    );
  }

  static ThemeData get darkTheme {
     return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      primaryColor: PrismColors.brandDefault,
      scaffoldBackgroundColor: PrismColors.bgDark,
       colorScheme: ColorScheme.fromSeed(
        seedColor: PrismColors.brandDefault,
        brightness: Brightness.dark,
        primary: PrismColors.brandDefault,
        secondary: PrismColors.brandLight,
        error: PrismColors.error,
        surface: PrismColors.bgCardDark,
      ),
      textTheme: PrismTypography.lightTextTheme.apply(
        bodyColor: PrismColors.textLight,
        displayColor: PrismColors.textLight,
      ),
       cardTheme: CardThemeData(
        color: PrismColors.bgCardDark,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
          side: const BorderSide(color: PrismColors.borderDark),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: PrismColors.bgSidebarDark,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: PrismColors.borderDark),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: PrismColors.borderDark),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: PrismColors.brandDefault, width: 2),
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      ),
      popupMenuTheme: PopupMenuThemeData(
        color: PrismColors.bgCardDark,
        surfaceTintColor: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
          side: const BorderSide(color: PrismColors.borderDark),
        ),
      ),
     );
  }
}
