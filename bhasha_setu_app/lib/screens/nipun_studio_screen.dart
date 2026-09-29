import 'package:flutter/material.dart';
import '../core/theme/palash_colors.dart';
import '../core/theme/palash_glass.dart';
import '../core/theme/palash_typography.dart';
import '../data/app_state.dart';
import '../models/language_models.dart';
import '../widgets/flip_flashcard_widget.dart';
import '../widgets/worksheet_dialog.dart';

class NipunStudioScreen extends StatelessWidget {
  final PalashAppState appState;

  const NipunStudioScreen({
    super.key,
    required this.appState,
  });

  void _openWorksheetGenerator(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return WorksheetGenerationDialog(
          grade: appState.selectedGrade,
          competency: appState.selectedCompetency == FLNCompetency.all
              ? FLNCompetency.numeracy
              : appState.selectedCompetency,
          language: appState.selectedLanguage,
          onCompleted: (newWorksheet) {
            appState.addGeneratedWorksheet(newWorksheet);
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final flashcards = appState.filteredFlashcards;

    return Scaffold(
      backgroundColor: PalashColors.bgDark,
      body: SafeArea(
        bottom: false,
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(16, 12, 16, 100),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Studio Header
              _buildHeader(context),

              const SizedBox(height: 16),

              // Grade Level Selector Chips
              _buildGradeSelector(),

              const SizedBox(height: 14),

              // NIPUN Competency Domain Tabs
              _buildCompetencyTabs(),

              const SizedBox(height: 20),

              // Section 1: Interactive 3D Bilingual Flashcards
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const Icon(Icons.style_rounded,
                          size: 18, color: PalashColors.emeraldPrimary),
                      const SizedBox(width: 8),
                      Text('Dual-Language Flashcards',
                          style: PalashTypography.titleLarge),
                    ],
                  ),
                  Text(
                    '${flashcards.length} Cards',
                    style: PalashTypography.labelSmall.copyWith(
                      color: PalashColors.textSecondary,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 12),

              // Horizontal 3D Flashcards Carousel
              if (flashcards.isNotEmpty)
                SizedBox(
                  height: 330,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemCount: flashcards.length,
                    separatorBuilder: (_, _) => const SizedBox(width: 14),
                    itemBuilder: (context, index) {
                      final card = flashcards[index];
                      return SizedBox(
                        width: 250,
                        child: FlipFlashcardWidget(
                          item: card,
                          language: appState.selectedLanguage,
                          onPlayPronunciation: () {
                            appState.speakText(card.tribalDevanagari);
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                backgroundColor:
                                    PalashColors.bgSurfaceElevated,
                                duration: const Duration(seconds: 1),
                                content: Text(
                                  '🔊 Pronouncing "${card.tribalWord}" (${card.tribalDevanagari}) in ${appState.selectedLanguage.displayName}',
                                  style: PalashTypography.bodyMedium.copyWith(
                                    color: PalashColors.emeraldPrimary,
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      );
                    },
                  ),
                )
              else
                _buildEmptyFlashcards(),

              const SizedBox(height: 24),

              // Primary Action: Generate AI Worksheet
              _buildWorksheetActionCard(context),

              const SizedBox(height: 24),

              // Section 2: Recent Printable Worksheets
              Row(
                children: [
                  const Icon(Icons.article_rounded,
                      size: 18, color: PalashColors.cyanElectric),
                  const SizedBox(width: 8),
                  Text('Compiled NIPUN Worksheets',
                      style: PalashTypography.titleLarge),
                ],
              ),

              const SizedBox(height: 12),

              ...appState.worksheets.map((ws) {
                return _buildWorksheetSummaryCard(context, ws);
              }),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: PalashColors.emeraldPrimary.withValues(alpha: 0.4),
                  width: 1.2,
                ),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(9),
                child: Image.asset(
                  'assets/images/bhasha_app_logo.jpeg',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('NIPUN Studio', style: PalashTypography.headlineSmall),
                Text(
                  'Foundational Literacy & Numeracy (FLN) Toolkit',
                  style: PalashTypography.labelSmall.copyWith(fontSize: 10),
                ),
              ],
            ),
          ],
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
          decoration: BoxDecoration(
            color: PalashColors.emeraldPrimary.withValues(alpha: 0.15),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: PalashColors.emeraldPrimary.withValues(alpha: 0.4),
            ),
          ),
          child: Row(
            children: [
              const Icon(Icons.print_rounded,
                  size: 14, color: PalashColors.emeraldPrimary),
              const SizedBox(width: 6),
              Text(
                'Ready to Print',
                style: PalashTypography.labelSmall.copyWith(
                  color: PalashColors.emeraldPrimary,
                  fontWeight: FontWeight.w700,
                  fontSize: 10,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildGradeSelector() {
    return Row(
      children: FLNGrade.values.map((grade) {
        final isSelected = appState.selectedGrade == grade;
        return Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 3),
            child: GestureDetector(
              onTap: () => appState.setGrade(grade),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
                decoration: BoxDecoration(
                  color: isSelected
                      ? grade.color.withValues(alpha: 0.2)
                      : PalashColors.glassWhite,
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(
                    color: isSelected ? grade.color : PalashColors.glassBorder,
                    width: isSelected ? 1.5 : 1.0,
                  ),
                ),
                child: Column(
                  children: [
                    Text(
                      grade.label,
                      style: PalashTypography.titleMedium.copyWith(
                        color: isSelected ? grade.color : Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Text(
                      grade.ageRange,
                      style: PalashTypography.labelSmall.copyWith(
                        color: isSelected
                            ? PalashColors.textPrimary
                            : PalashColors.textMuted,
                        fontSize: 9,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      }).toList(),
    );
  }

  Widget _buildCompetencyTabs() {
    return SizedBox(
      height: 38,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: FLNCompetency.values.length,
        separatorBuilder: (_, _) => const SizedBox(width: 8),
        itemBuilder: (context, index) {
          final comp = FLNCompetency.values[index];
          final isSelected = appState.selectedCompetency == comp;

          return GestureDetector(
            onTap: () => appState.setCompetency(comp),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: isSelected
                    ? PalashColors.emeraldPrimary.withValues(alpha: 0.2)
                    : PalashColors.glassWhite,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: isSelected
                      ? PalashColors.emeraldPrimary
                      : PalashColors.glassBorder,
                  width: isSelected ? 1.2 : 1.0,
                ),
              ),
              child: Row(
                children: [
                  Icon(
                    comp.icon,
                    size: 14,
                    color: isSelected
                        ? PalashColors.emeraldPrimary
                        : PalashColors.textMuted,
                  ),
                  const SizedBox(width: 6),
                  Text(
                    comp.label,
                    style: PalashTypography.labelSmall.copyWith(
                      color: isSelected
                          ? PalashColors.emeraldPrimary
                          : PalashColors.textSecondary,
                      fontWeight:
                          isSelected ? FontWeight.w700 : FontWeight.w500,
                      fontSize: 11,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildWorksheetActionCard(BuildContext context) {
    return GlassCard(
      borderRadius: 24,
      padding: const EdgeInsets.all(20),
      backgroundColor: const Color(0xE50B162E),
      borderGradient: const LinearGradient(
        colors: [PalashColors.cyanElectric, PalashColors.emeraldPrimary],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
      child: Row(
        children: [
          Container(
            width: 52,
            height: 52,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: PalashColors.aiGlowGradient,
              boxShadow: [
                BoxShadow(
                  color: PalashColors.cyanElectric.withValues(alpha: 0.4),
                  blurRadius: 16,
                ),
              ],
            ),
            child: const Icon(
              Icons.auto_awesome_rounded,
              size: 28,
              color: Color(0xFF06101E),
            ),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Generate FLN Worksheet',
                  style: PalashTypography.titleLarge.copyWith(fontSize: 16),
                ),
                const SizedBox(height: 2),
                Text(
                  'Auto-compile printable bilingual matching & tracing drills',
                  style: PalashTypography.bodyMedium.copyWith(fontSize: 11),
                ),
              ],
            ),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: PalashColors.emeraldPrimary,
              foregroundColor: const Color(0xFF06101E),
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            onPressed: () => _openWorksheetGenerator(context),
            child: const Text('Generate',
                style: TextStyle(fontWeight: FontWeight.w800, fontSize: 12)),
          ),
        ],
      ),
    );
  }

  Widget _buildWorksheetSummaryCard(BuildContext context, WorksheetItem ws) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: GlassCard(
        borderRadius: 18,
        padding: const EdgeInsets.all(14),
        backgroundColor: const Color(0xB30F172A),
        borderColor: PalashColors.glassBorder,
        onTap: () {
          // Open preview
          showDialog(
            context: context,
            builder: (context) {
              return Dialog(
                backgroundColor: Colors.transparent,
                insetPadding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
                child: GlassCard(
                  borderRadius: 24,
                  padding: const EdgeInsets.all(20),
                  backgroundColor: const Color(0xF50A1020),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Printable Sheet Preview',
                              style: PalashTypography.titleLarge),
                          IconButton(
                            icon: const Icon(Icons.close_rounded,
                                color: PalashColors.textSecondary),
                            onPressed: () => Navigator.pop(context),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Text(ws.title, style: PalashTypography.devanagariHero),
                      Text(ws.instructionHindi,
                          style: PalashTypography.devanagariSub),
                      const SizedBox(height: 16),
                      ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: PalashColors.emeraldPrimary,
                          foregroundColor: const Color(0xFF06101E),
                          minimumSize: const Size(double.infinity, 44),
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text('🖨️ Sent to Bluetooth Printer')),
                          );
                        },
                        icon: const Icon(Icons.print_rounded),
                        label: const Text('Print Now'),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: PalashColors.cyanElectric.withValues(alpha: 0.15),
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Icon(Icons.description_rounded,
                  color: PalashColors.cyanElectric, size: 22),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    ws.title,
                    style: PalashTypography.devanagariBody.copyWith(
                      fontSize: 13,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    '${ws.learningOutcomeCode} • ${ws.grade.label} • ${ws.generatedTime}',
                    style: PalashTypography.labelSmall.copyWith(
                      color: PalashColors.textMuted,
                      fontSize: 10,
                    ),
                  ),
                ],
              ),
            ),
            const Icon(Icons.chevron_right_rounded,
                color: PalashColors.textMuted),
          ],
        ),
      ),
    );
  }

  Widget _buildEmptyFlashcards() {
    return GlassCard(
      borderRadius: 18,
      padding: const EdgeInsets.all(24),
      child: Center(
        child: Column(
          children: [
            const Icon(Icons.auto_stories_outlined,
                size: 36, color: PalashColors.textMuted),
            const SizedBox(height: 10),
            Text(
              'No flashcards found for this domain',
              style: PalashTypography.bodyMedium,
            ),
          ],
        ),
      ),
    );
  }
}
