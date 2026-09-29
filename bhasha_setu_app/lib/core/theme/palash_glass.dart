import 'dart:ui';
import 'package:flutter/material.dart';
import 'palash_colors.dart';

class GlassCard extends StatelessWidget {
  final Widget child;
  final double borderRadius;
  final EdgeInsetsGeometry padding;
  final EdgeInsetsGeometry? margin;
  final Color? backgroundColor;
  final Color? borderColor;
  final double borderWidth;
  final double blur;
  final VoidCallback? onTap;
  final Gradient? borderGradient;

  const GlassCard({
    super.key,
    required this.child,
    this.borderRadius = 20.0,
    this.padding = const EdgeInsets.all(16.0),
    this.margin,
    this.backgroundColor,
    this.borderColor,
    this.borderWidth = 1.0,
    this.blur = 16.0,
    this.onTap,
    this.borderGradient,
  });

  @override
  Widget build(BuildContext context) {
    Widget cardContent = ClipRRect(
      borderRadius: BorderRadius.circular(borderRadius),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: blur, sigmaY: blur),
        child: Container(
          padding: padding,
          decoration: BoxDecoration(
            color: backgroundColor ?? PalashColors.glassWhite,
            borderRadius: BorderRadius.circular(borderRadius),
            border: borderGradient == null
                ? Border.all(
                    color: borderColor ?? PalashColors.glassBorder,
                    width: borderWidth,
                  )
                : null,
          ),
          child: child,
        ),
      ),
    );

    if (borderGradient != null) {
      cardContent = Container(
        margin: margin,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(borderRadius),
          gradient: borderGradient,
          boxShadow: [
            BoxShadow(
              color: PalashColors.emeraldPrimary.withValues(alpha: 0.15),
              blurRadius: 18,
              spreadRadius: -2,
            ),
          ],
        ),
        padding: EdgeInsets.all(borderWidth),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(borderRadius - borderWidth),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: blur, sigmaY: blur),
            child: Container(
              padding: padding,
              decoration: BoxDecoration(
                color: backgroundColor ?? const Color(0xE00F172A),
                borderRadius: BorderRadius.circular(borderRadius - borderWidth),
              ),
              child: child,
            ),
          ),
        ),
      );
    } else if (margin != null) {
      cardContent = Padding(padding: margin!, child: cardContent);
    }

    if (onTap != null) {
      return Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(borderRadius),
          onTap: onTap,
          splashColor: PalashColors.emeraldPrimary.withValues(alpha: 0.15),
          highlightColor: PalashColors.cyanElectric.withValues(alpha: 0.08),
          child: cardContent,
        ),
      );
    }

    return cardContent;
  }
}

class GlowingPillBadge extends StatelessWidget {
  final Widget child;
  final Color glowColor;
  final EdgeInsetsGeometry padding;
  final VoidCallback? onTap;

  const GlowingPillBadge({
    super.key,
    required this.child,
    this.glowColor = PalashColors.emeraldPrimary,
    this.padding = const EdgeInsets.symmetric(horizontal: 14, vertical: 7),
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    Widget content = Container(
      padding: padding,
      decoration: BoxDecoration(
        color: glowColor.withValues(alpha: 0.12),
        borderRadius: BorderRadius.circular(30),
        border: Border.all(
          color: glowColor.withValues(alpha: 0.4),
          width: 1.2,
        ),
        boxShadow: [
          BoxShadow(
            color: glowColor.withValues(alpha: 0.2),
            blurRadius: 10,
            spreadRadius: 1,
          ),
        ],
      ),
      child: child,
    );

    if (onTap != null) {
      return InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(30),
        child: content,
      );
    }
    return content;
  }
}
