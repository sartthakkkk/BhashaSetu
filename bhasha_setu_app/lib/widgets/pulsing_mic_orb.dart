import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../core/theme/palash_colors.dart';
import '../core/theme/palash_typography.dart';

class PulsingMicOrb extends StatefulWidget {
  final bool isListening;
  final bool isSynthesizing;
  final VoidCallback onStart;
  final VoidCallback onStop;
  final String statusText;

  const PulsingMicOrb({
    super.key,
    required this.isListening,
    required this.isSynthesizing,
    required this.onStart,
    required this.onStop,
    this.statusText = 'Hold to Speak in Hindi',
  });

  @override
  State<PulsingMicOrb> createState() => _PulsingMicOrbState();
}

class _PulsingMicOrbState extends State<PulsingMicOrb>
    with SingleTickerProviderStateMixin {
  late AnimationController _rippleController;
  bool _isPressed = false;

  @override
  void initState() {
    super.initState();
    _rippleController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1800),
    )..repeat();
  }

  @override
  void dispose() {
    _rippleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // Pulsating Center Orb with Ripples
        GestureDetector(
          onTapDown: (_) {
            setState(() => _isPressed = true);
            widget.onStart();
          },
          onTapUp: (_) {
            setState(() => _isPressed = false);
            widget.onStop();
          },
          onTapCancel: () {
            if (_isPressed) {
              setState(() => _isPressed = false);
              widget.onStop();
            }
          },
          child: AnimatedScale(
            scale: _isPressed || widget.isListening ? 1.08 : 1.0,
            duration: const Duration(milliseconds: 180),
            curve: Curves.easeOutBack,
            child: SizedBox(
              width: 130,
              height: 130,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  // Animated Outer Ripple 1
                  if (widget.isListening)
                    AnimatedBuilder(
                      animation: _rippleController,
                      builder: (context, child) {
                        final wave = _rippleController.value;
                        return Container(
                          width: 80 + (wave * 50),
                          height: 80 + (wave * 50),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: PalashColors.emeraldPrimary
                                  .withValues(alpha: (1.0 - wave) * 0.6),
                              width: 2.5,
                            ),
                          ),
                        );
                      },
                    ),

                  // Animated Outer Ripple 2
                  if (widget.isListening)
                    AnimatedBuilder(
                      animation: _rippleController,
                      builder: (context, child) {
                        final wave = (_rippleController.value + 0.5) % 1.0;
                        return Container(
                          width: 80 + (wave * 50),
                          height: 80 + (wave * 50),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: PalashColors.cyanElectric
                                  .withValues(alpha: (1.0 - wave) * 0.5),
                              width: 2.0,
                            ),
                          ),
                        );
                      },
                    ),

                  // Neural Glowing Gradient Background
                  Container(
                    width: 90,
                    height: 90,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: widget.isSynthesizing
                          ? PalashColors.violetCyanGradient
                          : PalashColors.micOrbGradient,
                      boxShadow: [
                        BoxShadow(
                          color: (widget.isSynthesizing
                                  ? PalashColors.violetInference
                                  : PalashColors.emeraldPrimary)
                              .withValues(
                                  alpha: widget.isListening ? 0.7 : 0.45),
                          blurRadius: widget.isListening ? 36 : 22,
                          spreadRadius: widget.isListening ? 4 : 0,
                        ),
                        BoxShadow(
                          color: PalashColors.cyanElectric
                              .withValues(alpha: 0.35),
                          blurRadius: 18,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Center(
                      child: widget.isSynthesizing
                          ? const SizedBox(
                              width: 32,
                              height: 32,
                              child: CircularProgressIndicator(
                                strokeWidth: 3.0,
                                valueColor:
                                    AlwaysStoppedAnimation<Color>(Colors.white),
                              ),
                            )
                          : Icon(
                              widget.isListening
                                  ? Icons.graphic_eq_rounded
                                  : Icons.mic_rounded,
                              size: 42,
                              color: const Color(0xFF06101E),
                            ),
                    ),
                  ),

                  // Subtle Top Shimmer Ring
                  Positioned(
                    top: 24,
                    child: Container(
                      width: 50,
                      height: 16,
                      decoration: BoxDecoration(
                        color: Colors.white.withValues(alpha: 0.25),
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),

        const SizedBox(height: 10),

        // Dynamic State Pill
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
          decoration: BoxDecoration(
            color: widget.isListening
                ? PalashColors.emeraldPrimary.withValues(alpha: 0.15)
                : (widget.isSynthesizing
                    ? PalashColors.violetInference.withValues(alpha: 0.15)
                    : PalashColors.glassWhite),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: widget.isListening
                  ? PalashColors.emeraldPrimary.withValues(alpha: 0.4)
                  : (widget.isSynthesizing
                      ? PalashColors.violetInference.withValues(alpha: 0.4)
                      : PalashColors.glassBorder),
              width: 1,
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (widget.isListening)
                Container(
                  width: 8,
                  height: 8,
                  margin: const EdgeInsets.only(right: 8),
                  decoration: const BoxDecoration(
                    color: PalashColors.emeraldPrimary,
                    shape: BoxShape.circle,
                  ),
                )
                    .animate(onPlay: (controller) => controller.repeat())
                    .scale(
                        begin: const Offset(0.7, 0.7),
                        end: const Offset(1.3, 1.3),
                        duration: 600.ms,
                        curve: Curves.easeInOut)
                    .then()
                    .scale(
                        begin: const Offset(1.3, 1.3),
                        end: const Offset(0.7, 0.7),
                        duration: 600.ms)
              else if (widget.isSynthesizing)
                Container(
                  width: 8,
                  height: 8,
                  margin: const EdgeInsets.only(right: 8),
                  decoration: const BoxDecoration(
                    color: PalashColors.cyanElectric,
                    shape: BoxShape.circle,
                  ),
                )
              else
                Icon(
                  Icons.touch_app_rounded,
                  size: 13,
                  color: PalashColors.textSecondary.withValues(alpha: 0.8),
                ),
              if (!widget.isListening && !widget.isSynthesizing)
                const SizedBox(width: 6),
              Text(
                widget.isListening
                    ? 'Listening... Release to Translate'
                    : (widget.isSynthesizing
                        ? 'Synthesizing Neural MTB Speech...'
                        : 'Hold or Tap to Speak Hindi'),
                style: PalashTypography.labelSmall.copyWith(
                  color: widget.isListening
                      ? PalashColors.emeraldPrimary
                      : (widget.isSynthesizing
                          ? PalashColors.cyanElectric
                          : PalashColors.textSecondary),
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
