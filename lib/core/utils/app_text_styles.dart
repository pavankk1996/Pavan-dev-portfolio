import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_colors.dart';

/// Centralized text styles for the app
class AppTextStyles {
  AppTextStyles._(); // Prevent instantiation

  // Headings
  static final TextStyle headlineLarge = GoogleFonts.poppins(
    fontSize: 32,
    fontWeight: FontWeight.bold,
    color: AppColors.light.textPrimary,
  );

  static final TextStyle headlineMedium = GoogleFonts.poppins(
    fontSize: 24,
    fontWeight: FontWeight.w600,
    color: AppColors.light.textPrimary,
  );

  static final TextStyle headlineSmall = GoogleFonts.poppins(
    fontSize: 18,
    fontWeight: FontWeight.w500,
    color: AppColors.light.textPrimary,
  );

  // Body text
  static final TextStyle bodyLarge = GoogleFonts.inter(
    fontSize: 16,
    color: AppColors.light.textSecondary,
  );

  static final TextStyle bodyMedium = GoogleFonts.inter(
    fontSize: 14,
    color: AppColors.light.textSecondary,
  );

  static final TextStyle bodySmall = GoogleFonts.inter(
    fontSize: 12,
    color: AppColors.light.textSecondary,
  );
}
