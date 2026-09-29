import 'package:flutter/material.dart';
import '../core/theme/palash_colors.dart';
import '../core/theme/palash_glass.dart';
import '../core/theme/palash_typography.dart';
import '../data/app_state.dart';
import '../data/palash_mock_data.dart';
import '../models/language_models.dart';

class CustomDataFeederModal extends StatefulWidget {
  final PalashAppState appState;

  const CustomDataFeederModal({
    super.key,
    required this.appState,
  });

  @override
  State<CustomDataFeederModal> createState() => _CustomDataFeederModalState();
}

class _CustomDataFeederModalState extends State<CustomDataFeederModal> {
  final TextEditingController _textController = TextEditingController();

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  void _submitCustomPhrase(String phrase) {
    if (phrase.trim().isEmpty) return;
    Navigator.pop(context);
    widget.appState.startVoiceInput(phrase.trim());
    Future.delayed(const Duration(milliseconds: 400), () {
      widget.appState.stopVoiceInputAndTranslate(customHindi: phrase.trim());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Color(0xF5080E1C),
        borderRadius: BorderRadius.vertical(top: Radius.circular(28)),
        border: Border(
          top: BorderSide(color: PalashColors.glassBorderGlow, width: 1.5),
        ),
      ),
      padding: EdgeInsets.only(
        left: 20,
        right: 20,
        top: 20,
        bottom: MediaQuery.of(context).viewInsets.bottom + 24,
      ),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Handle Bar
            Center(
              child: Container(
                width: 44,
                height: 4,
                decoration: BoxDecoration(
                  color: PalashColors.textMuted.withValues(alpha: 0.5),
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
            ),
            const SizedBox(height: 16),

            // Modal Header
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color:
                            PalashColors.emeraldPrimary.withValues(alpha: 0.15),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Icon(
                        Icons.dynamic_feed_rounded,
                        color: PalashColors.emeraldPrimary,
                        size: 20,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Classroom Scenario Sandbox',
                          style: PalashTypography.titleLarge,
                        ),
                        Text(
                          'Test custom phrases or simulate FLN classroom situations',
                          style: PalashTypography.labelSmall,
                        ),
                      ],
                    ),
                  ],
                ),
                IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(Icons.close_rounded,
                      color: PalashColors.textSecondary),
                ),
              ],
            ),

            const SizedBox(height: 18),

            // Target Language Selector Bar
            Text('Select Target Tribal Language:',
                style: PalashTypography.labelSmall),
            const SizedBox(height: 8),
            Row(
              children: TribalLanguage.values.map((lang) {
                final isSelected = widget.appState.selectedLanguage == lang;
                return Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4),
                    child: GlassCard(
                      borderRadius: 14,
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 8),
                      backgroundColor: isSelected
                          ? lang.accentColor.withValues(alpha: 0.2)
                          : PalashColors.glassWhite,
                      borderColor: isSelected
                          ? lang.accentColor
                          : PalashColors.glassBorder,
                      borderWidth: isSelected ? 1.5 : 1.0,
                      onTap: () {
                        setState(() {
                          widget.appState.setSelectedLanguage(lang);
                        });
                      },
                      child: Column(
                        children: [
                          Text(
                            lang.displayName,
                            style: PalashTypography.titleMedium.copyWith(
                              color: isSelected
                                  ? lang.accentColor
                                  : PalashColors.textPrimary,
                              fontSize: 12,
                            ),
                          ),
                          Text(
                            lang.nativeName,
                            style: PalashTypography.labelSmall.copyWith(
                              color: isSelected
                                  ? PalashColors.textPrimary
                                  : PalashColors.textMuted,
                              fontSize: 10,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),

            const SizedBox(height: 20),

            // Custom Text Input Field
            Text('Type Custom Hindi Classroom Phrase:',
                style: PalashTypography.labelSmall),
            const SizedBox(height: 8),
            Container(
              decoration: BoxDecoration(
                color: const Color(0x330F172A),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: PalashColors.glassBorder),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _textController,
                      style: PalashTypography.devanagariBody,
                      decoration: InputDecoration(
                        hintText:
                            'उदा: "सभी बच्चे अपनी कॉपी और पेंसिल निकालें..."',
                        hintStyle: PalashTypography.devanagariSub.copyWith(
                          color: PalashColors.textMuted,
                        ),
                        border: InputBorder.none,
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 12),
                      ),
                      onSubmitted: _submitCustomPhrase,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(right: 8),
                    child: IconButton(
                      style: IconButton.styleFrom(
                        backgroundColor: PalashColors.emeraldPrimary,
                        foregroundColor: const Color(0xFF06101E),
                      ),
                      icon: const Icon(Icons.send_rounded, size: 18),
                      onPressed: () =>
                          _submitCustomPhrase(_textController.text),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // Pre-built Classroom Situation Chips
            Text('Or Pick a Ready Classroom Preset:',
                style: PalashTypography.labelSmall),
            const SizedBox(height: 10),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: PalashMockData.presetTeacherPrompts.map((preset) {
                final hindi = preset['hindi'] as String;
                final category = preset['category'] as String;
                final icon = preset['icon'] as IconData;

                return InkWell(
                  onTap: () => _submitCustomPhrase(hindi),
                  borderRadius: BorderRadius.circular(12),
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 12, vertical: 8),
                    decoration: BoxDecoration(
                      color: PalashColors.glassWhite,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: PalashColors.glassBorder),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(icon, size: 14, color: PalashColors.cyanElectric),
                        const SizedBox(width: 6),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              category,
                              style: PalashTypography.labelSmall.copyWith(
                                color: PalashColors.emeraldPrimary,
                                fontSize: 9,
                              ),
                            ),
                            Text(
                              hindi,
                              style: PalashTypography.devanagariSub.copyWith(
                                color: PalashColors.textPrimary,
                                fontSize: 11,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
