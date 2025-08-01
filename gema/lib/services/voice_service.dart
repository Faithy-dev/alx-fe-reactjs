import 'package:speech_to_text/speech_to_text.dart';

class VoiceService {
  final SpeechToText _speech = SpeechToText();

  bool _isAvailable = false;

 
  Future<void> initSpeech() async {
    _isAvailable = await _speech.initialize();
  }


  Future<String> listenOnce() async {
    if (!_isAvailable) await initSpeech();

    String spokenText = '';

    await _speech.listen(
      onResult: (result) {
        spokenText = result.recognizedWords;
      },
      listenMode: ListenMode.dictation,
    );

    await Future.delayed(const Duration(seconds: 5));
    await _speech.stop();

    return spokenText;
  }
}
