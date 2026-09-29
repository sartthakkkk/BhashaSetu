import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'palash_colors.dart';

class PalashTypography {
  PalashTypography._();

  // Modern UI Sans-Serif
  static TextStyle headlineLarge = GoogleFonts.plusJakartaSans(
    fontSize: 28,
    fontWeight: FontWeight.w800,
    color: PalashColors.textPrimary,
    letterSpacing: -0.5,
  );

  static TextStyle headlineMedium = GoogleFonts.plusJakartaSans(
    fontSize: 22,
    fontWeight: FontWeight.w700,
    color: PalashColors.textPrimary,
    letterSpacing: -0.3,
  );

  static TextStyle headlineSmall = GoogleFonts.plusJakartaSans(
    fontSize: 18,
    fontWeight: FontWeight.w600,
    color: PalashColors.textPrimary,
  );

  static TextStyle titleLarge = GoogleFonts.plusJakartaSans(
    fontSize: 16,
    fontWeight: FontWeight.w700,
    color: PalashColors.textPrimary,
  );

  static TextStyle titleMedium = GoogleFonts.plusJakartaSans(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    color: PalashColors.textPrimary,
  );

  static TextStyle bodyLarge = GoogleFonts.plusJakartaSans(
    fontSize: 15,
    fontWeight: FontWeight.w400,
    color: PalashColors.textPrimary,
    height: 1.4,
  );

  static TextStyle bodyMedium = GoogleFonts.plusJakartaSans(
    fontSize: 13,
    fontWeight: FontWeight.w400,
    color: PalashColors.textSecondary,
    height: 1.35,
  );

  static TextStyle labelSmall = GoogleFonts.plusJakartaSans(
    fontSize: 11,
    fontWeight: FontWeight.w600,
    color: PalashColors.textMuted,
    letterSpacing: 0.5,
  );

  // Devanagari Typography (Hindi & Tribal Transliteration)
  static TextStyle devanagariHero = GoogleFonts.notoSansDevanagari(
    fontSize: 20,
    fontWeight: FontWeight.w700,
    color: PalashColors.textPrimary,
    height: 1.4,
  );

  static TextStyle devanagariBody = GoogleFonts.notoSansDevanagari(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: PalashColors.textPrimary,
    height: 1.5,
  );

  static TextStyle devanagariSub = GoogleFonts.notoSansDevanagari(
    fontSize: 13,
    fontWeight: FontWeight.w400,
    color: PalashColors.textSecondary,
    height: 1.4,
  );

  // Ol Chiki Typography (Santhali Script ᱚᱞ ᱪᱤᱠᱤ)
  static TextStyle olChikiDisplay = const TextStyle(
    fontFamily: 'NotoSansOlChiki',
    fontSize: 22,
    fontWeight: FontWeight.w700,
    color: PalashColors.emeraldPrimary,
    letterSpacing: 0.5,
  );

  static TextStyle olChikiBody = const TextStyle(
    fontFamily: 'NotoSansOlChiki',
    fontSize: 18,
    fontWeight: FontWeight.w600,
    color: PalashColors.emeraldPrimary,
    height: 1.4,
  );
}
