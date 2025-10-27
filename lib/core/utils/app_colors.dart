import 'package:flutter/material.dart';

/// Centralized color definitions for both Light and Dark themes.
/// Uses static const values for maximum performance and consistency.
class AppColors {
  AppColors._(); // Prevent instantiation

  // ---- Common colors used across both themes ----
  static const Color primary = Color(0xFF1F88BE);
  static const Color accent = Color(0xFFF2711C);
  static const Color white = Colors.white;
  static const Color black = Colors.black;
  static const Color transparent = Colors.transparent;

  // ---- Theme palettes ----
  static final LightColors light = LightColors();
  static final DarkColors dark = DarkColors();
}

/// Light theme palette
class LightColors {
  final Color background = Colors.white;
  final Color textPrimary = Colors.black87;
  final Color textSecondary = Colors.black54;
  final Color buttonPrimary = AppColors.primary;
  final Color buttonSecondary = AppColors.accent;
  final Color cardColor = Color(0xFFF7F7F7);
  final Color divider = Color(0xFFE0E0E0);
}

/// Dark theme palette
class DarkColors {
  final Color background = Color(0xFF121212);
  final Color textPrimary = Colors.white;
  final Color textSecondary = Colors.white70;
  final Color buttonPrimary = AppColors.primary;
  final Color buttonSecondary = AppColors.accent;
  final Color cardColor = Color(0xFF1E1E1E);
  final Color divider = Color(0xFF2C2C2C);
}
