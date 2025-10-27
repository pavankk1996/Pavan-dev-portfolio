import 'package:flutter/material.dart';
import '../utils/app_colors.dart';
import '../utils/app_text_styles.dart';

/// A universal text widget that adapts to theme, font styling, and color mode.
/// Automatically applies app-wide text style and supports overrides.
class AppText extends StatelessWidget {
  final String text;
  final TextStyle? style;
  final Color? color;
  final TextAlign textAlign;
  final int? maxLines;
  final TextOverflow overflow;
  final double? fontSize;

  const AppText(
    this.text, {
    super.key,
    this.style,
    this.color = Colors.white,
    this.textAlign = TextAlign.start,
    this.maxLines,
    this.overflow = TextOverflow.visible,
    this.fontSize,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final defaultColor =
        color ?? (isDark ? AppColors.white : AppColors.light.textPrimary);

    // Merge font size + color into the style
    final effectiveStyle = (style ?? AppTextStyles.bodyLarge).copyWith(
      color: defaultColor,
      fontSize: fontSize ?? style?.fontSize ?? AppTextStyles.bodyLarge.fontSize,
    );

    return Text(
      text,
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: overflow,
      style: effectiveStyle,
    );
  }
}
