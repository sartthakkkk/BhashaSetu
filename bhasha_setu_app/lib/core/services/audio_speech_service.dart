import 'package:flutter/foundation.dart';
import 'package:flutter_tts/flutter_tts.dart';

class AudioSpeechService {
  static final AudioSpeechService _instance = AudioSpeechService._internal();
  factory AudioSpeechService() => _instance;
  AudioSpeechService._internal();

  final FlutterTts _flutterTts = FlutterTts();
  bool _isInitialized = false;
  bool _isSpeaking = false;
  bool get isSpeaking => _isSpeaking;

  VoidCallback? _onStartCallback;
  VoidCallback? _onCompleteCallback;

  Future<void> init() async {
    if (_isInitialized) return;
    try {
      await _flutterTts.setLanguage("hi-IN");
      await _flutterTts.setPitch(1.0);
      await _flutterTts.setSpeechRate(0.45);
      await _flutterTts.awaitSpeakCompletion(true);

      _flutterTts.setStartHandler(() {
        _isSpeaking = true;
        _onStartCallback?.call();
      });

      _flutterTts.setCompletionHandler(() {
        _isSpeaking = false;
        _onCompleteCallback?.call();
      });

      _flutterTts.setCancelHandler(() {
        _isSpeaking = false;
        _onCompleteCallback?.call();
      });

      _flutterTts.setErrorHandler((msg) {
        _isSpeaking = false;
        debugPrint("FlutterTts error: $msg");
        _onCompleteCallback?.call();
      });

      // On iOS enable audio session
      await _flutterTts.setIosAudioCategory(
        IosTextToSpeechAudioCategory.playback,
        [
          IosTextToSpeechAudioCategoryOptions.allowBluetooth,
          IosTextToSpeechAudioCategoryOptions.allowBluetoothA2DP,
          IosTextToSpeechAudioCategoryOptions.mixWithOthers,
        ],
      );

      _isInitialized = true;
    } catch (e) {
      debugPrint("FlutterTts init error: $e");
    }
  }

  Future<void> speak({
    required String text,
    double speed = 1.0,
    VoidCallback? onStart,
    VoidCallback? onComplete,
  }) async {
    await init();
    try {
      _onStartCallback = onStart;
      _onCompleteCallback = onComplete;

      // Rate: 0.35 for 0.75x slow, 0.45 for normal
      final rate = speed < 1.0 ? 0.35 : 0.45;
      await _flutterTts.setSpeechRate(rate);

      _isSpeaking = true;
      await _flutterTts.speak(text);
    } catch (e) {
      _isSpeaking = false;
      debugPrint("FlutterTts speak error: $e");
      onComplete?.call();
    }
  }

  Future<void> stop() async {
    try {
      _isSpeaking = false;
      await _flutterTts.stop();
    } catch (e) {
      debugPrint("FlutterTts stop error: $e");
    }
  }
}
