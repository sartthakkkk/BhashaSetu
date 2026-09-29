import 'package:flutter/material.dart';

enum TribalLanguage {
  santhali(
    code: 'sat',
    displayName: 'Santhali',
    nativeName: 'ᱥᱟᱱᱛᱟᱲᱤ',
    scriptName: 'Ol Chiki (ᱚᱞ ᱪᱤᱠᱤ)',
    region: 'Santhal Parganas, Jharkhand',
    accentColor: Color(0xFF00F5A0),
  ),
  ho(
    code: 'hoc',
    displayName: 'Ho',
    nativeName: 'हो जगर',
    scriptName: 'Warang Chiti / Devanagari',
    region: 'West Singhbhum, Jharkhand',
    accentColor: Color(0xFF00D2FF),
  ),
  mundari(
    code: 'unr',
    displayName: 'Mundari',
    nativeName: 'मुण्डारी',
    scriptName: 'Mundari Bani / Devanagari',
    region: 'Khunti & Ranchi, Jharkhand',
    accentColor: Color(0xFFFFB703),
  );

  final String code;
  final String displayName;
  final String nativeName;
  final String scriptName;
  final String region;
  final Color accentColor;

  const TribalLanguage({
    required this.code,
    required this.displayName,
    required this.nativeName,
    required this.scriptName,
    required this.region,
    required this.accentColor,
  });
}

enum FLNGrade {
  balvatika(label: 'Balvatika', ageRange: 'Age 3-6', color: Color(0xFFEC4899)),
  class1(label: 'Class 1', ageRange: 'Age 6-7', color: Color(0xFF8B5CF6)),
  class2(label: 'Class 2', ageRange: 'Age 7-8', color: Color(0xFF00D2FF));

  final String label;
  final String ageRange;
  final Color color;

  const FLNGrade({
    required this.label,
    required this.ageRange,
    required this.color,
  });
}

enum FLNCompetency {
  all(label: 'All Domains', icon: Icons.grid_view_rounded),
  numeracy(label: 'Foundational Numeracy', icon: Icons.calculate_outlined),
  oralLanguage(label: 'Oral Expression', icon: Icons.record_voice_over_outlined),
  phonological(label: 'Phonological Awareness', icon: Icons.hearing_outlined),
  vocabulary(label: 'Picture Vocabulary', icon: Icons.auto_stories_outlined),
  classroomCommands(label: 'Classroom Habits', icon: Icons.school_outlined);

  final String label;
  final IconData icon;

  const FLNCompetency({
    required this.label,
    required this.icon,
  });
}

class TranslationEntry {
  final String id;
  final String hindiText;
  final String tribalText; // Script text (e.g. Ol Chiki ᱚᱞ ᱪᱤᱠᱤ)
  final String devanagariTransliteration;
  final String phoneticPronunciation;
  final TribalLanguage language;
  final String category;
  final double confidence;
  final double latencySeconds;
  final List<double> audioWaveform;
  final double durationSeconds;
  final DateTime timestamp;
  final bool isBookmarked;

  const TranslationEntry({
    required this.id,
    required this.hindiText,
    required this.tribalText,
    required this.devanagariTransliteration,
    required this.phoneticPronunciation,
    required this.language,
    this.category = 'Classroom Command',
    this.confidence = 0.985,
    this.latencySeconds = 1.18,
    required this.audioWaveform,
    this.durationSeconds = 2.4,
    required this.timestamp,
    this.isBookmarked = false,
  });

  TranslationEntry copyWith({
    String? id,
    String? hindiText,
    String? tribalText,
    String? devanagariTransliteration,
    String? phoneticPronunciation,
    TribalLanguage? language,
    String? category,
    double? confidence,
    double? latencySeconds,
    List<double>? audioWaveform,
    double? durationSeconds,
    DateTime? timestamp,
    bool? isBookmarked,
  }) {
    return TranslationEntry(
      id: id ?? this.id,
      hindiText: hindiText ?? this.hindiText,
      tribalText: tribalText ?? this.tribalText,
      devanagariTransliteration:
          devanagariTransliteration ?? this.devanagariTransliteration,
      phoneticPronunciation:
          phoneticPronunciation ?? this.phoneticPronunciation,
      language: language ?? this.language,
      category: category ?? this.category,
      confidence: confidence ?? this.confidence,
      latencySeconds: latencySeconds ?? this.latencySeconds,
      audioWaveform: audioWaveform ?? this.audioWaveform,
      durationSeconds: durationSeconds ?? this.durationSeconds,
      timestamp: timestamp ?? this.timestamp,
      isBookmarked: isBookmarked ?? this.isBookmarked,
    );
  }
}

class FlashcardItem {
  final String id;
  final FLNGrade grade;
  final FLNCompetency competency;
  final String category;
  final String hindiWord;
  final String hindiContext;
  final String tribalWord; // Ol Chiki or target script
  final String tribalDevanagari;
  final String phoneticGuide;
  final String englishMeaning;
  final IconData visualIcon;
  final Color cardTint;
  final String exampleSentenceHindi;
  final String exampleSentenceTribal;

  const FlashcardItem({
    required this.id,
    required this.grade,
    required this.competency,
    required this.category,
    required this.hindiWord,
    required this.hindiContext,
    required this.tribalWord,
    required this.tribalDevanagari,
    required this.phoneticGuide,
    required this.englishMeaning,
    required this.visualIcon,
    required this.cardTint,
    required this.exampleSentenceHindi,
    required this.exampleSentenceTribal,
  });
}

class WorksheetItem {
  final String id;
  final String title;
  final FLNGrade grade;
  final FLNCompetency competency;
  final String learningOutcomeCode;
  final String instructionHindi;
  final String instructionTribal;
  final List<WorksheetMatchingPair> pairs;
  final List<String> tracingWords;
  final String generatedTime;

  const WorksheetItem({
    required this.id,
    required this.title,
    required this.grade,
    required this.competency,
    required this.learningOutcomeCode,
    required this.instructionHindi,
    required this.instructionTribal,
    required this.pairs,
    required this.tracingWords,
    required this.generatedTime,
  });
}

class WorksheetMatchingPair {
  final String hindiItem;
  final String tribalScript;
  final String tribalDevanagari;
  final IconData icon;

  const WorksheetMatchingPair({
    required this.hindiItem,
    required this.tribalScript,
    required this.tribalDevanagari,
    required this.icon,
  });
}

class CurriculumLesson {
  final String id;
  final int weekNumber;
  final String theme;
  final FLNGrade grade;
  final String subject;
  final String learningOutcome;
  final String summaryHindi;
  final String summaryTribal;
  final List<CurriculumDialogueStep> dialogueSteps;

  const CurriculumLesson({
    required this.id,
    required this.weekNumber,
    required this.theme,
    required this.grade,
    required this.subject,
    required this.learningOutcome,
    required this.summaryHindi,
    required this.summaryTribal,
    required this.dialogueSteps,
  });
}

class CurriculumDialogueStep {
  final String stepTitle;
  final String teacherHindi;
  final String tribalOlChiki;
  final String tribalDevanagari;
  final String studentExpectedResponse;

  const CurriculumDialogueStep({
    required this.stepTitle,
    required this.teacherHindi,
    required this.tribalOlChiki,
    required this.tribalDevanagari,
    required this.studentExpectedResponse,
  });
}
