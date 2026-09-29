import 'package:flutter/material.dart';
import '../core/theme/palash_colors.dart';
import '../core/theme/palash_glass.dart';
import '../core/theme/palash_typography.dart';
import '../data/app_state.dart';
import '../models/language_models.dart';

class CurriculumScreen extends StatefulWidget {
  final PalashAppState appState;

  const CurriculumScreen({
    super.key,
    required this.appState,
  });

  @override
  State<CurriculumScreen> createState() => _CurriculumScreenState();
}

class _CurriculumScreenState extends State<CurriculumScreen> {
  String? _expandedLessonId;

  @override
  void initState() {
    super.initState();
    if (widget.appState.curriculumLessons.isNotEmpty) {
      _expandedLessonId = widget.appState.curriculumLessons.first.id;
    }
  }

  @override
  Widget build(BuildContext context) {
    final lessons = widget.appState.curriculumLessons;

    return Scaffold(
      backgroundColor: PalashColors.bgDark,
      body: SafeArea(
        bottom: false,
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(16, 12, 16, 100),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('FLN Curriculum Hub',
                          style: PalashTypography.headlineSmall),
                      Text(
                        'Pre-Translated NIPUN Lesson Scripts & Dialogues',
                        style:
                            PalashTypography.labelSmall.copyWith(fontSize: 10),
                      ),
                    ],
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 4),
                    decoration: BoxDecoration(
                      color:
                          PalashColors.violetInference.withValues(alpha: 0.15),
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color:
                            PalashColors.violetInference.withValues(alpha: 0.4),
                      ),
                    ),
                    child: Text(
                      '12-Week Syllabus',
                      style: PalashTypography.labelSmall.copyWith(
                        color: PalashColors.violetInference,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 18),

              // Teacher Prompt Banner
              GlassCard(
                borderRadius: 18,
                padding: const EdgeInsets.all(14),
                backgroundColor: const Color(0x991E293B),
                borderColor: PalashColors.glassBorder,
                child: Row(
                  children: [
                    const Icon(Icons.tips_and_updates_rounded,
                        size: 22, color: PalashColors.amberWarm),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        'Tap any classroom dialogue step to hear authentic tribal pronunciation for children to repeat.',
                        style: PalashTypography.bodyMedium.copyWith(
                          color: PalashColors.textSecondary,
                          fontSize: 11.5,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 18),

              // Week-by-Week Lesson Plan Accordions
              ...lessons.map((lesson) {
                final isExpanded = _expandedLessonId == lesson.id;
                return _buildLessonAccordion(lesson, isExpanded);
              }),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLessonAccordion(CurriculumLesson lesson, bool isExpanded) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 14),
      child: GlassCard(
        borderRadius: 22,
        padding: const EdgeInsets.all(16),
        backgroundColor: const Color(0xE00F172A),
        borderColor: isExpanded
            ? PalashColors.emeraldPrimary.withValues(alpha: 0.5)
            : PalashColors.glassBorder,
        borderWidth: isExpanded ? 1.5 : 1.0,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header Row
            InkWell(
              onTap: () {
                setState(() {
                  _expandedLessonId = isExpanded ? null : lesson.id;
                });
              },
              child: Row(
                children: [
                  Container(
                    width: 38,
                    height: 38,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: isExpanded
                          ? PalashColors.aiGlowGradient
                          : const LinearGradient(
                              colors: [Color(0xFF1E293B), Color(0xFF0F172A)],
                            ),
                    ),
                    child: Center(
                      child: Text(
                        'W${lesson.weekNumber}',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w800,
                          color: isExpanded
                              ? const Color(0xFF06101E)
                              : PalashColors.emeraldPrimary,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 6, vertical: 2),
                              decoration: BoxDecoration(
                                color:
                                    lesson.grade.color.withValues(alpha: 0.15),
                                borderRadius: BorderRadius.circular(6),
                              ),
                              child: Text(
                                lesson.grade.label,
                                style: TextStyle(
                                  color: lesson.grade.color,
                                  fontSize: 9,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                            const SizedBox(width: 6),
                            Text(
                              lesson.subject,
                              style: PalashTypography.labelSmall.copyWith(
                                color: PalashColors.cyanElectric,
                                fontSize: 10,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 2),
                        Text(
                          lesson.theme,
                          style: PalashTypography.devanagariHero.copyWith(
                            fontSize: 14,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Icon(
                    isExpanded
                        ? Icons.keyboard_arrow_up_rounded
                        : Icons.keyboard_arrow_down_rounded,
                    color: PalashColors.textSecondary,
                  ),
                ],
              ),
            ),

            if (isExpanded) ...[
              const SizedBox(height: 14),
              const Divider(color: PalashColors.glassBorder, height: 1),
              const SizedBox(height: 12),

              // Learning Outcome Box
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: const Color(0x33000000),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: PalashColors.glassBorder),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Icon(Icons.check_circle_outline_rounded,
                            size: 14, color: PalashColors.emeraldPrimary),
                        const SizedBox(width: 6),
                        Text('FLN Learning Outcome (दक्षता):',
                            style: PalashTypography.labelSmall.copyWith(
                              color: PalashColors.emeraldPrimary,
                              fontWeight: FontWeight.w700,
                            )),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Text(
                      lesson.learningOutcome,
                      style: PalashTypography.devanagariBody.copyWith(
                        fontSize: 12,
                        color: PalashColors.textPrimary,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 14),

              Text('Classroom Bilingual Script Steps:',
                  style: PalashTypography.titleMedium.copyWith(fontSize: 13)),

              const SizedBox(height: 8),

              // Dialogue Steps
              for (final step in lesson.dialogueSteps)
                Container(
                  margin: const EdgeInsets.only(bottom: 10),
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: const Color(0x4D0F172A),
                    borderRadius: BorderRadius.circular(14),
                    border: Border.all(
                        color: PalashColors.glassBorder.withValues(alpha: 0.5)),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            step.stepTitle,
                            style: PalashTypography.labelSmall.copyWith(
                              color: PalashColors.amberWarm,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              widget.appState.speakText(step.tribalDevanagari);
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  backgroundColor:
                                      PalashColors.bgSurfaceElevated,
                                  duration: const Duration(seconds: 1),
                                  content: Text(
                                    '🔊 Playing script audio: "${step.tribalDevanagari}"',
                                    style: PalashTypography.bodyMedium
                                        .copyWith(
                                            color:
                                                PalashColors.emeraldPrimary),
                                  ),
                                ),
                              );
                            },
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 8, vertical: 3),
                              decoration: BoxDecoration(
                                color: PalashColors.emeraldPrimary
                                    .withValues(alpha: 0.15),
                                borderRadius: BorderRadius.circular(6),
                              ),
                              child: Row(
                                children: [
                                  const Icon(Icons.volume_up_rounded,
                                      size: 13,
                                      color: PalashColors.emeraldPrimary),
                                  const SizedBox(width: 4),
                                  Text(
                                    'Play Audio',
                                    style: PalashTypography.labelSmall.copyWith(
                                      color: PalashColors.emeraldPrimary,
                                      fontSize: 9.5,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 6),
                      Text(
                        'शिक्षक (Hindi): ${step.teacherHindi}',
                        style: PalashTypography.devanagariBody.copyWith(
                          fontSize: 12.5,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'ᱥᱟᱱᱛᱟᱲᱤ: ${step.tribalOlChiki}',
                        style: PalashTypography.olChikiBody.copyWith(
                          fontSize: 14,
                          color: PalashColors.emeraldPrimary,
                        ),
                      ),
                      Text(
                        'उच्चारण: ${step.tribalDevanagari}',
                        style: PalashTypography.devanagariSub.copyWith(
                          fontSize: 11,
                          color: PalashColors.textMuted,
                        ),
                      ),
                    ],
                  ),
                ),
            ],
          ],
        ),
      ),
    );
  }
}
