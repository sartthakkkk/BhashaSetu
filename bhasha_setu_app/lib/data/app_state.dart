import 'dart:async';
import 'dart:math';
import 'package:flutter/foundation.dart';
import '../core/services/audio_speech_service.dart';
import '../models/language_models.dart';
import 'palash_mock_data.dart';

class PalashAppState extends ChangeNotifier {
  final AudioSpeechService _speechService = AudioSpeechService();

  // Active Target Tribal Language
  TribalLanguage _selectedLanguage = TribalLanguage.santhali;
  TribalLanguage get selectedLanguage => _selectedLanguage;

  void setSelectedLanguage(TribalLanguage language) {
    if (_selectedLanguage != language) {
      _selectedLanguage = language;
      notifyListeners();
    }
  }

  // Translation Stream & History
  final List<TranslationEntry> _translations = List.from(PalashMockData.defaultTranslations);
  List<TranslationEntry> get translations => List.unmodifiable(_translations);

  // Live Voice AI State
  bool _isListening = false;
  bool get isListening => _isListening;

  bool _isSynthesizing = false;
  bool get isSynthesizing => _isSynthesizing;

  String _currentSpeechInput = '';
  String get currentSpeechInput => _currentSpeechInput;

  double _simulatedLatency = 0.0;
  double get simulatedLatency => _simulatedLatency;

  // Audio Playback Simulation & TTS
  String? _currentlyPlayingId;
  String? get currentlyPlayingId => _currentlyPlayingId;

  double _playbackSpeed = 1.0; // 0.75 or 1.0
  double get playbackSpeed => _playbackSpeed;

  Timer? _playbackTimer;
  double _playbackProgress = 0.0;
  double get playbackProgress => _playbackProgress;

  // NIPUN Studio Filters
  FLNGrade _selectedGrade = FLNGrade.balvatika;
  FLNGrade get selectedGrade => _selectedGrade;

  FLNCompetency _selectedCompetency = FLNCompetency.all;
  FLNCompetency get selectedCompetency => _selectedCompetency;

  void setGrade(FLNGrade grade) {
    _selectedGrade = grade;
    notifyListeners();
  }

  void setCompetency(FLNCompetency competency) {
    _selectedCompetency = competency;
    notifyListeners();
  }

  List<FlashcardItem> get filteredFlashcards {
    return PalashMockData.flashcards.where((fc) {
      final matchGrade = fc.grade == _selectedGrade;
      final matchComp = _selectedCompetency == FLNCompetency.all ||
          fc.competency == _selectedCompetency;
      return matchGrade && matchComp;
    }).toList();
  }

  // Worksheets
  final List<WorksheetItem> _worksheets = List.from(PalashMockData.sampleWorksheets);
  List<WorksheetItem> get worksheets => List.unmodifiable(_worksheets);

  // Curriculum Lessons
  List<CurriculumLesson> get curriculumLessons => PalashMockData.curriculumLessons;

  // Push-to-Talk Simulation Handler
  Timer? _micHoldTimer;

  void startVoiceInput([String? overrideText]) {
    _isListening = true;
    _isSynthesizing = false;
    _currentSpeechInput = overrideText ?? 'शिक्षक बोल रहे हैं... (Listening in Hindi)';
    notifyListeners();
  }

  void stopVoiceInputAndTranslate({String? customHindi}) {
    if (!_isListening && customHindi == null) return;
    
    _isListening = false;
    _isSynthesizing = true;
    _simulatedLatency = (0.7 + Random().nextDouble() * 0.5); // 0.7s to 1.2s realistic offline AI
    notifyListeners();

    final inputToProcess = customHindi ?? 
        (_currentSpeechInput.contains('Listening') 
            ? 'सभी बच्चे पंक्ति में सीधे खड़े हो जाओ।' 
            : _currentSpeechInput);

    // Simulate ultra-fast on-device neural synthesis
    Future.delayed(Duration(milliseconds: (_simulatedLatency * 1000).toInt()), () {
      final newTranslation = PalashMockData.generateTranslation(
        inputToProcess,
        _selectedLanguage,
      ).copyWith(latencySeconds: _simulatedLatency);

      _translations.insert(0, newTranslation);
      _isSynthesizing = false;
      _currentSpeechInput = '';
      notifyListeners();

      // Auto-trigger playback with real sound
      playAudio(newTranslation.id);
    });
  }

  // Audio Playback & Sound Synthesis
  void togglePlaybackSpeed() {
    _playbackSpeed = _playbackSpeed == 1.0 ? 0.75 : 1.0;
    notifyListeners();
    // If currently playing, restart with new speed
    if (_currentlyPlayingId != null) {
      final id = _currentlyPlayingId!;
      _speechService.stop();
      playAudio(id);
    }
  }

  void playAudio(String translationId) {
    if (_currentlyPlayingId == translationId) {
      stopAudio();
      return;
    }

    _playbackTimer?.cancel();
    _currentlyPlayingId = translationId;
    _playbackProgress = 0.0;
    notifyListeners();

    // Find the text to speak aloud
    final item = _translations.firstWhere(
      (t) => t.id == translationId,
      orElse: () => _translations.first,
    );

    // Speak aloud with TTS audio speaker
    _speechService.speak(
      text: item.devanagariTransliteration,
      speed: _playbackSpeed,
      onComplete: () {
        stopAudio();
      },
    );

    // Visual equalizer bar animation (cycles smoothly until TTS completes)
    _playbackTimer = Timer.periodic(const Duration(milliseconds: 100), (timer) {
      _playbackProgress = (_playbackProgress + 0.05);
      if (_playbackProgress > 1.0) {
        _playbackProgress = 0.1;
      }
      notifyListeners();
    });
  }

  void speakText(String text) {
    _speechService.speak(text: text, speed: _playbackSpeed);
  }

  void stopAudio() {
    _playbackTimer?.cancel();
    _playbackTimer = null;
    _currentlyPlayingId = null;
    _playbackProgress = 0.0;
    _speechService.stop();
    notifyListeners();
  }

  // Worksheet Generator
  void addGeneratedWorksheet(WorksheetItem worksheet) {
    _worksheets.insert(0, worksheet);
    notifyListeners();
  }

  // Bookmark Toggle
  void toggleBookmark(String id) {
    final index = _translations.indexWhere((t) => t.id == id);
    if (index != -1) {
      final current = _translations[index];
      _translations[index] = current.copyWith(isBookmarked: !current.isBookmarked);
      notifyListeners();
    }
  }

  @override
  void dispose() {
    _micHoldTimer?.cancel();
    _playbackTimer?.cancel();
    super.dispose();
  }
}
