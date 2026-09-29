import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../core/theme/palash_colors.dart';
import '../core/theme/palash_glass.dart';
import '../core/theme/palash_typography.dart';
import '../data/app_state.dart';
import '../data/palash_mock_data.dart';
import '../models/language_models.dart';
import '../widgets/custom_data_feeder_modal.dart';
import '../widgets/pulsing_mic_orb.dart';
import '../widgets/waveform_visualizer.dart';

class LiveTranslationScreen extends StatelessWidget {
  final PalashAppState appState;

  const LiveTranslationScreen({
    super.key,
    required this.appState,
  });

  void _openDataFeeder(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => CustomDataFeederModal(appState: appState),
    );
  }

  void _showLanguagePicker(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return Container(
          padding: const EdgeInsets.all(24),
          decoration: const BoxDecoration(
            color: Color(0xF50F172A),
            borderRadius: BorderRadius.vertical(top: Radius.circular(28)),
            border: Border(
              top: BorderSide(color: PalashColors.glassBorderGlow, width: 1.5),
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Switch Target Tribal Language',
                  style: PalashTypography.titleLarge),
              const SizedBox(height: 6),
              Text(
                'Instant on-device neural switching with zero lag',
                style: PalashTypography.bodyMedium,
              ),
              const SizedBox(height: 18),
              ...TribalLanguage.values.map((lang) {
                final isSelected = appState.selectedLanguage == lang;
                return Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: GlassCard(
                    borderRadius: 16,
                    padding: const EdgeInsets.all(14),
                    backgroundColor: isSelected
                        ? lang.accentColor.withValues(alpha: 0.15)
                        : PalashColors.glassWhite,
                    borderColor: isSelected
                        ? lang.accentColor
                        : PalashColors.glassBorder,
                    borderWidth: isSelected ? 1.5 : 1.0,
                    onTap: () {
                      appState.setSelectedLanguage(lang);
                      Navigator.pop(context);
                    },
                    child: Row(
                      children: [
                        Container(
                          width: 12,
                          height: 12,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: lang.accentColor,
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '${lang.displayName} • ${lang.nativeName}',
                                style: PalashTypography.titleMedium.copyWith(
                                  color: isSelected
                                      ? lang.accentColor
                                      : PalashColors.textPrimary,
                                ),
                              ),
                              Text(
                                '${lang.scriptName} | ${lang.region}',
                                style: PalashTypography.labelSmall.copyWith(
                                  color: PalashColors.textSecondary,
                                  fontSize: 10,
                                ),
                              ),
                            ],
                          ),
                        ),
                        if (isSelected)
                          Icon(Icons.check_circle_rounded,
                              color: lang.accentColor, size: 20),
                      ],
                    ),
                  ),
                );
              }),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final activeLanguage = appState.selectedLanguage;
    final latestTranslation = appState.translations.isNotEmpty
        ? appState.translations.first
        : null;

    return Scaffold(
      backgroundColor: PalashColors.bgDark,
      body: SafeArea(
        bottom: false,
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(16, 12, 16, 100),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Top Header Bar
              _buildTopBar(context, activeLanguage),

              const SizedBox(height: 14),

              // Sub-2s Neural Status Shimmer Pill
              _buildNeuralStatusBadge(),

              const SizedBox(height: 16),

              // Live Dual-Card Translation Container
              if (latestTranslation != null)
                _buildDualCardTranslation(context, latestTranslation),

              const SizedBox(height: 20),

              // Central Push-To-Talk Mic Orb
              Center(
                child: PulsingMicOrb(
                  isListening: appState.isListening,
                  isSynthesizing: appState.isSynthesizing,
                  onStart: () => appState.startVoiceInput(),
                  onStop: () => appState.stopVoiceInputAndTranslate(),
                ),
              ),

              const SizedBox(height: 24),

              // Quick Classroom Preset Prompts Header
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const Icon(Icons.flash_on_rounded,
                          size: 16, color: PalashColors.amberWarm),
                      const SizedBox(width: 6),
                      Text(
                        'Classroom Quick Commands',
                        style: PalashTypography.titleMedium,
                      ),
                    ],
                  ),
                  TextButton.icon(
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.zero,
                      foregroundColor: PalashColors.cyanElectric,
                    ),
                    onPressed: () => _openDataFeeder(context),
                    icon: const Icon(Icons.edit_note_rounded, size: 16),
                    label: Text('Custom Text',
                        style: PalashTypography.labelSmall
                            .copyWith(color: PalashColors.cyanElectric)),
                  ),
                ],
              ),

              const SizedBox(height: 8),

              // Quick Command Carousel
              _buildQuickCommandsList(),

              const SizedBox(height: 22),

              // Session History Stream
              Row(
                children: [
                  const Icon(Icons.history_rounded,
                      size: 16, color: PalashColors.textSecondary),
                  const SizedBox(width: 6),
                  Text('Recent Classroom Translations',
                      style: PalashTypography.titleMedium),
                ],
              ),

              const SizedBox(height: 10),

              // History Cards
              ...appState.translations.skip(1).map((item) {
                return _buildHistoryCard(context, item);
              }),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTopBar(BuildContext context, TribalLanguage activeLanguage) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // App Logo & Brand Title
        Row(
          children: [
            Container(
              width: 44,
              height: 44,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: PalashColors.emeraldPrimary.withValues(alpha: 0.4),
                  width: 1.2,
                ),
                boxShadow: [
                  BoxShadow(
                    color: PalashColors.emeraldPrimary.withValues(alpha: 0.25),
                    blurRadius: 10,
                    spreadRadius: -1,
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(11),
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
                Row(
                  children: [
                    Text('PALASH', style: PalashTypography.headlineSmall),
                    const SizedBox(width: 6),
                    Container(
                      padding:
                          const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                      decoration: BoxDecoration(
                        gradient: PalashColors.aiGlowGradient,
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: const Text(
                        'MTB-MLE AI',
                        style: TextStyle(
                          fontSize: 9,
                          fontWeight: FontWeight.w900,
                          color: Color(0xFF06101E),
                        ),
                      ),
                    ),
                  ],
                ),
                Text(
                  'Jharkhand Tribal Primary Education',
                  style: PalashTypography.labelSmall.copyWith(fontSize: 10),
                ),
              ],
            ),
          ],
        ),

        // Floating Language Switcher Pill
        GlowingPillBadge(
          glowColor: activeLanguage.accentColor,
          onTap: () => _showLanguagePicker(context),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text('हिन्दी',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.w600)),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 6),
                child: Icon(Icons.arrow_forward_rounded,
                    size: 13, color: PalashColors.cyanElectric),
              ),
              Text(
                activeLanguage.displayName,
                style: TextStyle(
                  color: activeLanguage.accentColor,
                  fontSize: 12,
                  fontWeight: FontWeight.w800,
                ),
              ),
              const SizedBox(width: 4),
              Icon(Icons.keyboard_arrow_down_rounded,
                  size: 16, color: activeLanguage.accentColor),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildNeuralStatusBadge() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      decoration: BoxDecoration(
        color: const Color(0x330B132B),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: PalashColors.glassBorder),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                width: 7,
                height: 7,
                decoration: const BoxDecoration(
                  color: PalashColors.emeraldPrimary,
                  shape: BoxShape.circle,
                ),
              ),
              const SizedBox(width: 8),
              Text(
                'Offline Edge NPU Active • Zero Latency (1.1s)',
                style: PalashTypography.labelSmall.copyWith(
                  color: PalashColors.emeraldPrimary,
                  fontSize: 10.5,
                ),
              ),
            ],
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
            decoration: BoxDecoration(
              color: PalashColors.glassWhiteStrong,
              borderRadius: BorderRadius.circular(4),
            ),
            child: Text(
              '100% On-Device',
              style: PalashTypography.labelSmall.copyWith(
                color: PalashColors.cyanElectric,
                fontSize: 9,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDualCardTranslation(
      BuildContext context, TranslationEntry item) {
    final isCurrentlyPlaying = appState.currentlyPlayingId == item.id;

    return GlassCard(
      borderRadius: 24,
      padding: const EdgeInsets.all(18),
      backgroundColor: const Color(0xE50F172A),
      borderGradient: const LinearGradient(
        colors: [PalashColors.emeraldPrimary, PalashColors.cyanElectric],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Sub-Header with Category & Latency
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: PalashColors.glassWhite,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  children: [
                    const Icon(Icons.school_rounded,
                        size: 12, color: PalashColors.emeraldPrimary),
                    const SizedBox(width: 5),
                    Text(
                      item.category,
                      style: PalashTypography.labelSmall.copyWith(
                        color: PalashColors.emeraldPrimary,
                        fontWeight: FontWeight.w700,
                        fontSize: 10,
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  Text(
                    'AI Latency: ${item.latencySeconds.toStringAsFixed(2)}s',
                    style: PalashTypography.labelSmall.copyWith(
                      color: PalashColors.cyanElectric,
                      fontSize: 10,
                    ),
                  ),
                  const SizedBox(width: 8),
                  GestureDetector(
                    onTap: () => appState.toggleBookmark(item.id),
                    child: Icon(
                      item.isBookmarked
                          ? Icons.bookmark_rounded
                          : Icons.bookmark_border_rounded,
                      size: 18,
                      color: item.isBookmarked
                          ? PalashColors.amberWarm
                          : PalashColors.textMuted,
                    ),
                  ),
                ],
              ),
            ],
          ),

          const SizedBox(height: 14),

          // Input Card (Teacher's Hindi Speech)
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: const Color(0x33000000),
              borderRadius: BorderRadius.circular(14),
              border: Border.all(color: PalashColors.glassBorder),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 6, vertical: 3),
                  decoration: BoxDecoration(
                    color: PalashColors.glassWhiteStrong,
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Text(
                    'शिक्षक (Hindi)',
                    style: GoogleFonts.notoSansDevanagari(
                      fontSize: 9,
                      fontWeight: FontWeight.w700,
                      color: PalashColors.textSecondary,
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(
                    item.hindiText,
                    style: PalashTypography.devanagariBody.copyWith(
                      fontSize: 14,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 14),

          // Output Section (Tribal Target Language in Native Script)
          Row(
            children: [
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 6, vertical: 3),
                decoration: BoxDecoration(
                  color:
                      item.language.accentColor.withValues(alpha: 0.2),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Text(
                  '${item.language.displayName} (${item.language.scriptName})',
                  style: TextStyle(
                    fontSize: 9,
                    fontWeight: FontWeight.w800,
                    color: item.language.accentColor,
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Container(
                width: 6,
                height: 6,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: item.language.accentColor,
                ),
              ),
            ],
          ),

          const SizedBox(height: 8),

          // Native Ol Chiki Script
          Text(
            item.tribalText,
            style: PalashTypography.olChikiDisplay.copyWith(
              fontSize: 21,
              color: item.language.accentColor,
            ),
          ),

          const SizedBox(height: 4),

          // Devanagari Transliteration & Phonetics
          Text(
            'उच्चारण: ${item.devanagariTransliteration}',
            style: PalashTypography.devanagariSub.copyWith(
              color: PalashColors.textPrimary,
              fontSize: 13,
            ),
          ),
          Text(
            'Phonetic: /${item.phoneticPronunciation}/',
            style: PalashTypography.labelSmall.copyWith(
              color: PalashColors.textMuted,
              fontStyle: FontStyle.italic,
              fontSize: 10.5,
            ),
          ),

          const SizedBox(height: 14),

          // Interactive Audio Player Bar
          WaveformVisualizer(
            isPlaying: isCurrentlyPlaying,
            progress: isCurrentlyPlaying ? appState.playbackProgress : 0.0,
            playbackSpeed: appState.playbackSpeed,
            onTogglePlay: () => appState.playAudio(item.id),
            onToggleSpeed: () => appState.togglePlaybackSpeed(),
            customWaveform: item.audioWaveform,
          ),
        ],
      ),
    );
  }

  Widget _buildQuickCommandsList() {
    return SizedBox(
      height: 78,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: PalashMockData.presetTeacherPrompts.length,
        separatorBuilder: (_, _) => const SizedBox(width: 10),
        itemBuilder: (context, index) {
          final prompt = PalashMockData.presetTeacherPrompts[index];
          final hindi = prompt['hindi'] as String;
          final category = prompt['category'] as String;
          final icon = prompt['icon'] as IconData;

          return GlassCard(
            borderRadius: 16,
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
            backgroundColor: const Color(0xCC111C33),
            borderColor: PalashColors.glassBorder,
            onTap: () {
              appState.startVoiceInput(hindi);
              Future.delayed(const Duration(milliseconds: 350), () {
                appState.stopVoiceInputAndTranslate(customHindi: hindi);
              });
            },
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: PalashColors.cyanElectric.withValues(alpha: 0.15),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Icon(icon, size: 18, color: PalashColors.cyanElectric),
                ),
                const SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      category,
                      style: PalashTypography.labelSmall.copyWith(
                        color: PalashColors.emeraldPrimary,
                        fontSize: 9.5,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      hindi,
                      style: PalashTypography.devanagariSub.copyWith(
                        color: Colors.white,
                        fontSize: 11,
                        fontWeight: FontWeight.w600,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildHistoryCard(BuildContext context, TranslationEntry item) {
    final isPlaying = appState.currentlyPlayingId == item.id;

    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: GlassCard(
        borderRadius: 16,
        padding: const EdgeInsets.all(12),
        backgroundColor: const Color(0xB30F172A),
        borderColor: PalashColors.glassBorder,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '${item.category} • ${item.language.displayName}',
                  style: PalashTypography.labelSmall.copyWith(
                    color: item.language.accentColor,
                    fontSize: 10,
                  ),
                ),
                Text(
                  '${item.latencySeconds}s latency',
                  style: PalashTypography.labelSmall.copyWith(
                    color: PalashColors.textMuted,
                    fontSize: 9,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 6),
            Text(
              item.hindiText,
              style: PalashTypography.devanagariBody.copyWith(
                fontSize: 12.5,
                color: PalashColors.textSecondary,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              item.tribalText,
              style: PalashTypography.olChikiDisplay.copyWith(
                fontSize: 15,
                color: item.language.accentColor,
              ),
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    item.devanagariTransliteration,
                    style: PalashTypography.devanagariSub.copyWith(
                      fontSize: 11,
                      color: PalashColors.textMuted,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const SizedBox(width: 8),
                GestureDetector(
                  onTap: () => appState.playAudio(item.id),
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: isPlaying
                          ? PalashColors.emeraldPrimary
                          : PalashColors.glassWhiteStrong,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      children: [
                        Icon(
                          isPlaying
                              ? Icons.pause_rounded
                              : Icons.play_arrow_rounded,
                          size: 14,
                          color: isPlaying
                              ? const Color(0xFF06101E)
                              : PalashColors.emeraldPrimary,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          isPlaying ? 'Playing' : 'Audio',
                          style: PalashTypography.labelSmall.copyWith(
                            color: isPlaying
                                ? const Color(0xFF06101E)
                                : PalashColors.emeraldPrimary,
                            fontSize: 10,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
