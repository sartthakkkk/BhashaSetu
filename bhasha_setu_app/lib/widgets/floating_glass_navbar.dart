import 'dart:ui';
import 'package:flutter/material.dart';
import '../core/theme/palash_colors.dart';
import '../core/theme/palash_typography.dart';

class FloatingGlassNavbar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTabSelected;

  const FloatingGlassNavbar({
    super.key,
    required this.currentIndex,
    required this.onTabSelected,
  });

  @override
  Widget build(BuildContext context) {
    final items = [
      {'icon': Icons.mic_rounded, 'label': 'Live Voice'},
      {'icon': Icons.auto_awesome_motion_rounded, 'label': 'NIPUN Studio'},
      {'icon': Icons.menu_book_rounded, 'label': 'Curriculum'},
      {'icon': Icons.tune_rounded, 'label': 'Offline Hub'},
    ];

    return Container(
      margin: const EdgeInsets.only(left: 18, right: 18, bottom: 20),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
            decoration: BoxDecoration(
              color: const Color(0xCC0F172A),
              borderRadius: BorderRadius.circular(30),
              border: Border.all(
                color: PalashColors.glassBorderGlow.withValues(alpha: 0.35),
                width: 1.2,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.5),
                  blurRadius: 25,
                  offset: const Offset(0, 10),
                ),
                BoxShadow(
                  color: PalashColors.emeraldPrimary.withValues(alpha: 0.1),
                  blurRadius: 20,
                  spreadRadius: -5,
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: List.generate(items.length, (index) {
                final item = items[index];
                final isSelected = currentIndex == index;

                return GestureDetector(
                  onTap: () => onTabSelected(index),
                  behavior: HitTestBehavior.opaque,
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 250),
                    curve: Curves.easeOutCubic,
                    padding: EdgeInsets.symmetric(
                      horizontal: isSelected ? 16 : 12,
                      vertical: 8,
                    ),
                    decoration: BoxDecoration(
                      color: isSelected
                          ? PalashColors.emeraldPrimary.withValues(alpha: 0.15)
                          : Colors.transparent,
                      borderRadius: BorderRadius.circular(22),
                      border: isSelected
                          ? Border.all(
                              color: PalashColors.emeraldPrimary
                                  .withValues(alpha: 0.5),
                              width: 1,
                            )
                          : null,
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          item['icon'] as IconData,
                          color: isSelected
                              ? PalashColors.emeraldPrimary
                              : PalashColors.textMuted,
                          size: 20,
                        ),
                        if (isSelected) ...[
                          const SizedBox(width: 8),
                          Text(
                            item['label'] as String,
                            style: PalashTypography.labelSmall.copyWith(
                              color: PalashColors.emeraldPrimary,
                              fontWeight: FontWeight.w700,
                              fontSize: 11,
                            ),
                          ),
                        ],
                      ],
                    ),
                  ),
                );
              }),
            ),
          ),
        ),
      ),
    );
  }
}
