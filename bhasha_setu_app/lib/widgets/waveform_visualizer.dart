import 'dart:math';
import 'package:flutter/material.dart';
import '../core/theme/palash_colors.dart';
import '../core/theme/palash_typography.dart';

class WaveformVisualizer extends StatefulWidget {
  final bool isPlaying;
  final double progress;
  final double playbackSpeed;
  final VoidCallback onTogglePlay;
  final VoidCallback onToggleSpeed;
  final List<double>? customWaveform;
  final String durationLabel;

  const WaveformVisualizer({
    super.key,
    required this.isPlaying,
    required this.progress,
    required this.playbackSpeed,
    required this.onTogglePlay,
    required this.onToggleSpeed,
    this.customWaveform,
    this.durationLabel = '0:03',
  });

  @override
  State<WaveformVisualizer> createState() => _WaveformVisualizerState();
}

class _WaveformVisualizerState extends State<WaveformVisualizer>
    with SingleTickerProviderStateMixin {
  late AnimationController _animController;

  @override
  void initState() {
    super.initState();
    _animController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );
    if (widget.isPlaying) {
      _animController.repeat(reverse: true);
    }
  }

  @override
  void didUpdateWidget(covariant WaveformVisualizer oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.isPlaying && !_animController.isAnimating) {
      _animController.repeat(reverse: true);
    } else if (!widget.isPlaying && _animController.isAnimating) {
      _animController.stop();
      _animController.reset();
    }
  }

  @override
  void dispose() {
    _animController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bars = widget.customWaveform ??
        [0.2, 0.45, 0.8, 0.6, 0.95, 0.4, 0.75, 0.3, 0.65, 0.85, 0.5, 0.3];

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: const Color(0x33060E1A),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(
          color: widget.isPlaying
              ? PalashColors.emeraldPrimary.withValues(alpha: 0.4)
              : PalashColors.glassBorder,
          width: 1,
        ),
      ),
      child: Row(
        children: [
          // Play / Pause Circle Button
          GestureDetector(
            onTap: widget.onTogglePlay,
            child: Container(
              width: 38,
              height: 38,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: widget.isPlaying
                    ? PalashColors.aiGlowGradient
                    : const LinearGradient(
                        colors: [Color(0xFF1E293B), Color(0xFF0F172A)],
                      ),
                boxShadow: widget.isPlaying
                    ? [
                        BoxShadow(
                          color:
                              PalashColors.emeraldPrimary.withValues(alpha: 0.4),
                          blurRadius: 10,
                          spreadRadius: 1,
                        ),
                      ]
                    : null,
              ),
              child: Icon(
                widget.isPlaying ? Icons.pause_rounded : Icons.play_arrow_rounded,
                color: widget.isPlaying
                    ? const Color(0xFF06101E)
                    : PalashColors.emeraldPrimary,
                size: 22,
              ),
            ),
          ),

          const SizedBox(width: 12),

          // Animated Waveform Bars
          Expanded(
            child: SizedBox(
              height: 32,
              child: AnimatedBuilder(
                animation: _animController,
                builder: (context, child) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: List.generate(bars.length, (index) {
                      final barBase = bars[index];
                      final isPastProgress =
                          (index / bars.length) <= widget.progress;

                      // Add lively oscillation when actively playing
                      final dynamicHeight = widget.isPlaying
                          ? (barBase * 24 * (0.6 + 0.4 * sin(_animController.value * pi + index)))
                              .clamp(6.0, 30.0)
                          : (barBase * 24).clamp(4.0, 26.0);

                      return AnimatedContainer(
                        duration: const Duration(milliseconds: 80),
                        width: 4,
                        height: dynamicHeight,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(3),
                          color: isPastProgress
                              ? PalashColors.emeraldPrimary
                              : (widget.isPlaying
                                  ? PalashColors.cyanElectric
                                      .withValues(alpha: 0.5)
                                  : PalashColors.textMuted
                                      .withValues(alpha: 0.4)),
                          boxShadow: isPastProgress && widget.isPlaying
                              ? [
                                  BoxShadow(
                                    color: PalashColors.emeraldPrimary
                                        .withValues(alpha: 0.5),
                                    blurRadius: 4,
                                  ),
                                ]
                              : null,
                        ),
                      );
                    }),
                  );
                },
              ),
            ),
          ),

          const SizedBox(width: 10),

          // Speed Switcher Pill (1.0x / 0.75x slow for classroom repetition)
          GestureDetector(
            onTap: widget.onToggleSpeed,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: PalashColors.glassWhiteStrong,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: PalashColors.glassBorder,
                  width: 1,
                ),
              ),
              child: Text(
                '${widget.playbackSpeed}x',
                style: PalashTypography.labelSmall.copyWith(
                  color: widget.playbackSpeed < 1.0
                      ? PalashColors.amberWarm
                      : PalashColors.textSecondary,
                  fontWeight: FontWeight.w700,
                  fontSize: 10,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
