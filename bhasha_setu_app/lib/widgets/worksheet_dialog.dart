import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import '../core/theme/palash_colors.dart';
import '../core/theme/palash_glass.dart';
import '../core/theme/palash_typography.dart';
import '../models/language_models.dart';

class WorksheetGenerationDialog extends StatefulWidget {
  final FLNGrade grade;
  final FLNCompetency competency;
  final TribalLanguage language;
  final Function(WorksheetItem) onCompleted;

  const WorksheetGenerationDialog({
    super.key,
    required this.grade,
    required this.competency,
    required this.language,
    required this.onCompleted,
  });

  @override
  State<WorksheetGenerationDialog> createState() =>
      _WorksheetGenerationDialogState();
}

class _WorksheetGenerationDialogState extends State<WorksheetGenerationDialog> {
  int _currentStep = 0;
  bool _isFinished = false;
  late WorksheetItem _generatedWorksheet;

  final List<String> _pipelineSteps = [
    'Mapping NIPUN Bharat FLN Learning Outcomes...',
    'Extracting Bilingual Vocabulary (Hindi ⇄ Santhali Ol Chiki)...',
    'Synthesizing Interactive Matching & Tracing Grids...',
    'Compiling Printable High-Resolution Classroom Sheet...',
  ];

  @override
  void initState() {
    super.initState();
    _startGenerationPipeline();
  }

  void _startGenerationPipeline() {
    Timer.periodic(const Duration(milliseconds: 650), (timer) {
      if (!mounted) {
        timer.cancel();
        return;
      }
      if (_currentStep < _pipelineSteps.length - 1) {
        setState(() => _currentStep++);
      } else {
        timer.cancel();
        _createGeneratedWorksheet();
        setState(() => _isFinished = true);
      }
    });
  }

  void _createGeneratedWorksheet() {
    _generatedWorksheet = WorksheetItem(
      id: 'ws_ai_${DateTime.now().millisecondsSinceEpoch}',
      title: 'NIPUN FLN: ${widget.competency.label} अभ्यास पत्रक',
      grade: widget.grade,
      competency: widget.competency,
      learningOutcomeCode: 'FLN-${widget.grade.name.toUpperCase()}-08',
      instructionHindi:
          'दिए गए चित्रों को पहचानें और सही संथाली (ओल चिकी) शब्दों से मिलान करें।',
      instructionTribal:
          'ᱮᱢ ᱟᱠᱟᱱ ᱪᱤᱛᱟᱹᱨ ᱩᱨᱩᱢ ᱠᱟᱛᱮ ᱥᱟᱹᱨᱤ ᱥᱟᱱᱛᱟᱲᱤ (ᱚᱞ ᱪᱤᱠᱤ) ᱟᱹᱲᱟᱹ ᱥᱟᱶ ᱡᱚᱲᱟᱣ ᱢᱮ᱾',
      pairs: [
        const WorksheetMatchingPair(
          hindiItem: '१ (एक) - सेब',
          tribalScript: '᱑ - ᱢᱤᱫ',
          tribalDevanagari: '१ - मिद',
          icon: Icons.apple_rounded,
        ),
        const WorksheetMatchingPair(
          hindiItem: '२ (दो) - तारे',
          tribalScript: '᱒ - ᱵᱟᱨ',
          tribalDevanagari: '२ - बार',
          icon: Icons.star_rounded,
        ),
        const WorksheetMatchingPair(
          hindiItem: '३ (तीन) - चिड़िया',
          tribalScript: '᱓ - ᱯᱮ',
          tribalDevanagari: '३ - पे',
          icon: Icons.flutter_dash_rounded,
        ),
        const WorksheetMatchingPair(
          hindiItem: '५ (पाँच) - पत्ते',
          tribalScript: '᱕ - ᱢᱚᱬᱮ',
          tribalDevanagari: '५ - मोणे',
          icon: Icons.eco_rounded,
        ),
      ],
      tracingWords: ['᱑ (ᱢᱤᱫ)', '᱒ (ᱵᱟᱨ)', '᱓ (ᱯᱮ)', '᱕ (ᱢᱚᱬᱮ)'],
      generatedTime: 'AI Compiled: ${DateTime.now().hour}:${DateTime.now().minute.toString().padLeft(2, '0')}',
    );
    widget.onCompleted(_generatedWorksheet);
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
      child: GlassCard(
        borderRadius: 28,
        padding: const EdgeInsets.all(24),
        backgroundColor: const Color(0xF50A1020),
        borderGradient: const LinearGradient(
          colors: [PalashColors.emeraldPrimary, PalashColors.cyanElectric],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        child: _isFinished ? _buildWorksheetPreview() : _buildProgressView(),
      ),
    );
  }

  Widget _buildProgressView() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // AI Generator Animated Orb
        Container(
          width: 70,
          height: 70,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: PalashColors.aiGlowGradient,
            boxShadow: [
              BoxShadow(
                color: PalashColors.emeraldPrimary.withValues(alpha: 0.5),
                blurRadius: 24,
              ),
            ],
          ),
          child: const Center(
            child: Icon(
              Icons.auto_awesome_rounded,
              size: 36,
              color: Color(0xFF06101E),
            ),
          ),
        )
            .animate(onPlay: (controller) => controller.repeat())
            .rotate(duration: 3000.ms)
            .scale(
                begin: const Offset(0.9, 0.9),
                end: const Offset(1.1, 1.1),
                duration: 1000.ms,
                curve: Curves.easeInOut)
            .then()
            .scale(
                begin: const Offset(1.1, 1.1),
                end: const Offset(0.9, 0.9),
                duration: 1000.ms),

        const SizedBox(height: 20),

        Text(
          'Synthesizing FLN Worksheet',
          style: PalashTypography.headlineSmall.copyWith(fontSize: 18),
        ),
        const SizedBox(height: 6),
        Text(
          'Target: ${widget.grade.label} • ${widget.language.displayName}',
          style: PalashTypography.bodyMedium.copyWith(
            color: PalashColors.cyanElectric,
          ),
        ),

        const SizedBox(height: 24),

        // Steps Checklist
        ...List.generate(_pipelineSteps.length, (index) {
          final isDone = index < _currentStep;
          final isCurrent = index == _currentStep;

          return Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: Row(
              children: [
                Container(
                  width: 24,
                  height: 24,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: isDone
                        ? PalashColors.emeraldPrimary
                        : (isCurrent
                            ? PalashColors.cyanElectric.withValues(alpha: 0.2)
                            : PalashColors.glassWhite),
                    border: Border.all(
                      color: isDone || isCurrent
                          ? PalashColors.emeraldPrimary
                          : PalashColors.glassBorder,
                    ),
                  ),
                  child: isDone
                      ? const Icon(Icons.check_rounded,
                          size: 15, color: Color(0xFF06101E))
                      : (isCurrent
                          ? const Center(
                              child: SizedBox(
                                width: 12,
                                height: 12,
                                child: CircularProgressIndicator(
                                  strokeWidth: 2,
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                      PalashColors.cyanElectric),
                                ),
                              ),
                            )
                          : null),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    _pipelineSteps[index],
                    style: PalashTypography.bodyMedium.copyWith(
                      color: isDone || isCurrent
                          ? PalashColors.textPrimary
                          : PalashColors.textMuted,
                      fontWeight:
                          isCurrent ? FontWeight.w600 : FontWeight.w400,
                      fontSize: 12,
                    ),
                  ),
                ),
              ],
            ),
          );
        }),
      ],
    );
  }

  Widget _buildWorksheetPreview() {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header Bar
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: PalashColors.emeraldPrimary.withValues(alpha: 0.15),
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                    color: PalashColors.emeraldPrimary.withValues(alpha: 0.4),
                  ),
                ),
                child: Text(
                  '✓ NIPUN READY SHEET',
                  style: PalashTypography.labelSmall.copyWith(
                    color: PalashColors.emeraldPrimary,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              IconButton(
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(),
                icon: const Icon(Icons.close_rounded,
                    color: PalashColors.textSecondary),
                onPressed: () => Navigator.pop(context),
              ),
            ],
          ),

          const SizedBox(height: 12),

          // Worksheet Document Title
          Text(
            _generatedWorksheet.title,
            style: PalashTypography.devanagariHero.copyWith(
              fontSize: 17,
              color: Colors.white,
            ),
          ),
          Text(
            'Code: ${_generatedWorksheet.learningOutcomeCode} | Grade: ${_generatedWorksheet.grade.label}',
            style: PalashTypography.labelSmall.copyWith(
              color: PalashColors.cyanElectric,
            ),
          ),

          const SizedBox(height: 14),

          // Printable Paper Styled Container
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: const Color(0xFFF8FAFC),
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.3),
                  blurRadius: 16,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Top Header on Paper
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'नाम (Name): ______________',
                      style: GoogleFonts.notoSansDevanagari(
                        color: const Color(0xFF1E293B),
                        fontSize: 11,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      'दिनांक: ________',
                      style: GoogleFonts.notoSansDevanagari(
                        color: const Color(0xFF1E293B),
                        fontSize: 11,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                const Divider(color: Color(0xFFCBD5E1), height: 16),

                // Bilingual Instructions
                Text(
                  'निर्देश: ${_generatedWorksheet.instructionHindi}',
                  style: GoogleFonts.notoSansDevanagari(
                    color: const Color(0xFF0F172A),
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text(
                  _generatedWorksheet.instructionTribal,
                  style: const TextStyle(
                    fontFamily: 'NotoSansOlChiki',
                    color: Color(0xFF059669),
                    fontSize: 11,
                    fontWeight: FontWeight.w600,
                  ),
                ),

                const SizedBox(height: 12),

                // Matching Matrix Rows
                ..._generatedWorksheet.pairs.map((pair) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(pair.icon,
                                size: 18, color: const Color(0xFF334155)),
                            const SizedBox(width: 8),
                            Text(
                              pair.hindiItem,
                              style: GoogleFonts.notoSansDevanagari(
                                color: const Color(0xFF1E293B),
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                        Container(
                          width: 40,
                          height: 1,
                          color: const Color(0xFF94A3B8),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 3),
                          decoration: BoxDecoration(
                            border: Border.all(color: const Color(0xFFCBD5E1)),
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: Text(
                            pair.tribalScript,
                            style: const TextStyle(
                              fontFamily: 'NotoSansOlChiki',
                              color: Color(0xFF0F172A),
                              fontSize: 12,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                }),

                const SizedBox(height: 10),
                const Divider(color: Color(0xFFCBD5E1), height: 12),

                // Handwriting Tracing Band
                Text(
                  'सुलेख अभ्यास (Trace and Write Ol Chiki):',
                  style: GoogleFonts.notoSansDevanagari(
                    color: const Color(0xFF475569),
                    fontSize: 10,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 4),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: _generatedWorksheet.tracingWords.map((word) {
                    return Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 4),
                      decoration: BoxDecoration(
                        border: Border.all(
                            color: const Color(0xFF94A3B8),
                            style: BorderStyle.solid),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Text(
                        word,
                        style: const TextStyle(
                          fontFamily: 'NotoSansOlChiki',
                          color: Color(0xFF94A3B8),
                          fontSize: 13,
                          letterSpacing: 2,
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ],
            ),
          ),

          const SizedBox(height: 18),

          // Action Buttons: Print PDF & Share to School Tablet
          Row(
            children: [
              Expanded(
                child: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: PalashColors.emeraldPrimary,
                    foregroundColor: const Color(0xFF06101E),
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                  ),
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        backgroundColor: PalashColors.bgSurfaceElevated,
                        content: Text(
                          '🖨️ Sent to Bluetooth Printer (FLN Printable Sheet)',
                          style: PalashTypography.bodyMedium
                              .copyWith(color: PalashColors.emeraldPrimary),
                        ),
                      ),
                    );
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.print_rounded, size: 18),
                  label: const Text(
                    'Print Sheet (PDF)',
                    style: TextStyle(fontWeight: FontWeight.w700),
                  ),
                ),
              ),
              const SizedBox(width: 10),
              IconButton(
                style: IconButton.styleFrom(
                  backgroundColor: PalashColors.glassWhiteStrong,
                  padding: const EdgeInsets.all(12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                    side: const BorderSide(color: PalashColors.glassBorder),
                  ),
                ),
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      backgroundColor: PalashColors.bgSurfaceElevated,
                      content: Text(
                        '📤 Exported to Jharkhand State LMS Portal',
                        style: PalashTypography.bodyMedium
                            .copyWith(color: PalashColors.cyanElectric),
                      ),
                    ),
                  );
                },
                icon: const Icon(Icons.share_rounded,
                    color: PalashColors.textPrimary, size: 20),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
