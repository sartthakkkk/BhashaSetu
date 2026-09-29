import 'package:flutter/material.dart';

class PalashColors {
  PalashColors._();

  // Deep Slate Backgrounds
  static const Color bgDark = Color(0xFF070B14);
  static const Color bgSurface = Color(0xFF0F172A);
  static const Color bgSurfaceElevated = Color(0xFF1E293B);
  static const Color bgCard = Color(0xFF151E32);

  // Glassmorphism Tints
  static const Color glassWhite = Color(0x14FFFFFF);
  static const Color glassWhiteStrong = Color(0x24FFFFFF);
  static const Color glassBorder = Color(0x28FFFFFF);
  static const Color glassBorderGlow = Color(0x6000F5A0);

  // AI & Brand Accent Colors
  static const Color emeraldPrimary = Color(0xFF00F5A0);
  static const Color emeraldDark = Color(0xFF059669);
  static const Color cyanElectric = Color(0xFF00D2FF);
  static const Color violetInference = Color(0xFF8B5CF6);
  static const Color amberWarm = Color(0xFFFFB703);
  static const Color coralAlert = Color(0xFFFF5964);

  // Text Colors
  static const Color textPrimary = Color(0xFFF8FAFC);
  static const Color textSecondary = Color(0xFF94A3B8);
  static const Color textMuted = Color(0xFF64748B);
  static const Color textEmerald = Color(0xFF6EE7B7);

  // Gradients
  static const LinearGradient aiGlowGradient = LinearGradient(
    colors: [emeraldPrimary, cyanElectric],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient violetCyanGradient = LinearGradient(
    colors: [violetInference, cyanElectric],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient cardGlowGradient = LinearGradient(
    colors: [Color(0x2000F5A0), Color(0x1000D2FF), Color(0x050F172A)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient micOrbGradient = LinearGradient(
    colors: [Color(0xFF00F5A0), Color(0xFF00B4D8), Color(0xFF7209B7)],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );

  static const RadialGradient pulseGlow = RadialGradient(
    colors: [Color(0x6000F5A0), Color(0x1A00D2FF), Colors.transparent],
    radius: 0.8,
  );
}
