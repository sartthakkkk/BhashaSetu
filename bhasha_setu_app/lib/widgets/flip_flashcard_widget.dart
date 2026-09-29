import 'dart:math';
import 'package:flutter/material.dart';
import '../core/theme/palash_colors.dart';
import '../core/theme/palash_glass.dart';
import '../core/theme/palash_typography.dart';
import '../models/language_models.dart';

class FlipFlashcardWidget extends StatefulWidget {
  final FlashcardItem item;
  final TribalLanguage language;
  final VoidCallback? onPlayPronunciation;

  const FlipFlashcardWidget({
    super.key,
    required this.item,
    required this.language,
    this.onPlayPronunciation,
  });

  @override
  State<FlipFlashcardWidget> createState() => _FlipFlashcardWidgetState();
}

class _FlipFlashcardWidgetState extends State<FlipFlashcardWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  bool _isFront = true;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    _animation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOutCubic),
    );
  }

  void _flipCard() {
    if (_isFront) {
      _controller.forward();
    } else {
      _controller.reverse();
    }
    setState(() => _isFront = !_isFront);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _flipCard,
      child: AnimatedBuilder(
        animation: _animation,
        builder: (context, child) {
          final angle = _animation.value * pi;
          final isUnder = angle > (pi / 2);

          return Transform(
            transform: Matrix4.identity()
              ..setEntry(3, 2, 0.0015) // Perspective
              ..rotateY(angle),
            alignment: Alignment.center,
            child: isUnder
                ? Transform(
                    transform: Matrix4.identity()..rotateY(pi),
                    alignment: Alignment.center,
                    child: _buildBackCard(),
                  )
                : _buildFrontCard(),
          );
        },
      ),
    );
  }

  Widget _buildFrontCard() {
    return GlassCard(
      borderRadius: 24,
      padding: const EdgeInsets.all(20),
      backgroundColor: const Color(0xE50F172A),
      borderGradient: LinearGradient(
        colors: [
          widget.item.cardTint.withValues(alpha: 0.6),
          PalashColors.glassBorder,
        ],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header: Category Pill & Tap to Flip Prompt
          Row(
            children: [
              Expanded(
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: widget.item.cardTint.withValues(alpha: 0.15),
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: widget.item.cardTint.withValues(alpha: 0.4),
                      width: 1,
                    ),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(widget.item.competency.icon,
                          size: 13, color: widget.item.cardTint),
                      const SizedBox(width: 5),
                      Flexible(
                        child: Text(
                          widget.item.category,
                          style: PalashTypography.labelSmall.copyWith(
                            color: widget.item.cardTint,
                            fontWeight: FontWeight.w700,
                            fontSize: 10,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.flip_camera_android_rounded,
                    size: 13,
                    color: PalashColors.textSecondary.withValues(alpha: 0.7),
                  ),
                  const SizedBox(width: 3),
                  Text(
                    'Flip',
                    style: PalashTypography.labelSmall.copyWith(
                      color: PalashColors.textSecondary.withValues(alpha: 0.7),
                      fontSize: 10,
                    ),
                  ),
                ],
              ),
            ],
          ),

          const Spacer(),

          // Central Visual Icon in Glow Sphere
          Center(
            child: Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: RadialGradient(
                  colors: [
                    widget.item.cardTint.withValues(alpha: 0.25),
                    Colors.transparent,
                  ],
                ),
                border: Border.all(
                  color: widget.item.cardTint.withValues(alpha: 0.5),
                  width: 1.5,
                ),
              ),
              child: Icon(
                widget.item.visualIcon,
                size: 42,
                color: widget.item.cardTint,
              ),
            ),
          ),

          const Spacer(),

          // Hindi Word & Context
          Text(
            widget.item.hindiWord,
            style: PalashTypography.devanagariHero.copyWith(
              fontSize: 24,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 2),
          Text(
            widget.item.hindiContext,
            style: PalashTypography.bodyMedium.copyWith(
              color: PalashColors.textSecondary,
              fontSize: 12,
            ),
          ),

          const SizedBox(height: 8),

          // Example Sentence Preview
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
            decoration: BoxDecoration(
              color: PalashColors.glassWhite,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              children: [
                const Icon(Icons.format_quote_rounded,
                    size: 14, color: PalashColors.amberWarm),
                const SizedBox(width: 6),
                Expanded(
                  child: Text(
                    widget.item.exampleSentenceHindi,
                    style: PalashTypography.bodyMedium.copyWith(
                      color: PalashColors.textPrimary,
                      fontSize: 11,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBackCard() {
    return GlassCard(
      borderRadius: 24,
      padding: const EdgeInsets.all(20),
      backgroundColor: const Color(0xE50B132B),
      borderGradient: const LinearGradient(
        colors: [PalashColors.emeraldPrimary, PalashColors.cyanElectric],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header: Tribal Target Language Badge
          Row(
            children: [
              Expanded(
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  decoration: BoxDecoration(
                    color: PalashColors.emeraldPrimary.withValues(alpha: 0.15),
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: PalashColors.emeraldPrimary.withValues(alpha: 0.4),
                    ),
                  ),
                  child: Text(
                    '${widget.language.displayName} (${widget.language.scriptName})',
                    style: PalashTypography.labelSmall.copyWith(
                      color: PalashColors.emeraldPrimary,
                      fontWeight: FontWeight.w700,
                      fontSize: 10,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
              const SizedBox(width: 8),
              IconButton(
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(),
                onPressed: widget.onPlayPronunciation,
                icon: Container(
                  padding: const EdgeInsets.all(6),
                  decoration: const BoxDecoration(
                    color: PalashColors.emeraldPrimary,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.volume_up_rounded,
                    size: 16,
                    color: Color(0xFF06101E),
                  ),
                ),
              ),
            ],
          ),

          const Spacer(),

          // Large Script Display (Ol Chiki for Santhali)
          Center(
            child: Column(
              children: [
                Text(
                  widget.item.tribalWord,
                  style: PalashTypography.olChikiDisplay.copyWith(
                    fontSize: 32,
                    color: PalashColors.emeraldPrimary,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 6),
                Text(
                  'Devanagari: ${widget.item.tribalDevanagari}',
                  style: PalashTypography.devanagariBody.copyWith(
                    color: PalashColors.textPrimary,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  'Pronunciation: /${widget.item.phoneticGuide}/',
                  style: PalashTypography.labelSmall.copyWith(
                    color: PalashColors.cyanElectric,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ],
            ),
          ),

          const Spacer(),

          // Example Tribal Context Sentence
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            decoration: BoxDecoration(
              color: PalashColors.glassWhite,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: PalashColors.emeraldPrimary.withValues(alpha: 0.25),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Classroom Example:',
                  style: PalashTypography.labelSmall.copyWith(
                    color: PalashColors.textMuted,
                    fontSize: 9,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  widget.item.exampleSentenceTribal,
                  style: PalashTypography.olChikiBody.copyWith(
                    fontSize: 13,
                    color: PalashColors.textPrimary,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
