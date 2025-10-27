import 'package:flutter/material.dart';
import 'package:pavan_dev_portfolio/core/widgets/text.dart';

class UniversalButton extends StatelessWidget {
  final String? text;
  final IconData? icon;
  final Widget? image; // ✅ New field for image
  final VoidCallback? onPressed;
  final double? width;
  final double? height;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final double borderRadius;
  final bool isLoading;
  final TextStyle? textStyle;
  final EdgeInsetsGeometry padding;
  final double elevation;
  final double spacing; // ✅ space between image/icon/text

  const UniversalButton({
    super.key,
    this.text,
    this.icon,
    this.image, // ✅ Added image parameter
    required this.onPressed,
    this.width,
    this.height,
    this.backgroundColor,
    this.foregroundColor,
    this.borderRadius = 12,
    this.isLoading = false,
    this.textStyle,
    this.padding = const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
    this.elevation = 0,
    this.spacing = 8,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return SizedBox(
      width: width,
      height: height,
      child: FilledButton(
        onPressed: isLoading ? null : onPressed,
        style: FilledButton.styleFrom(
          backgroundColor: backgroundColor ?? theme.colorScheme.primary,
          foregroundColor: foregroundColor ?? theme.colorScheme.onPrimary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
          ),
          padding: padding,
          elevation: elevation,
          animationDuration: const Duration(milliseconds: 150),
        ),
        child: AnimatedSwitcher(
          duration: const Duration(milliseconds: 200),
          child: isLoading
              ? SizedBox(
                  key: const ValueKey('loading'),
                  width: 22,
                  height: 22,
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    color: foregroundColor ?? theme.colorScheme.onPrimary,
                  ),
                )
              : Row(
                  key: const ValueKey('content'),
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (image != null) ...[
                      image!,
                      if (text != null || icon != null)
                        SizedBox(width: spacing),
                    ],
                    if (icon != null) ...[
                      Icon(icon, size: 20),
                      if (text != null) SizedBox(width: spacing),
                    ],
                    if (text != null) AppText(text!),
                  ],
                ),
        ),
      ),
    );
  }
}
