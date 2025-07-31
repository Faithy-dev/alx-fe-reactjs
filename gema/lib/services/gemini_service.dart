import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:logging/logging.dart'; // <-- import logging package
import '../constants.dart';

class GeminiService {
  late final GenerativeModel _model;
  final Logger _logger = Logger('GeminiService'); // <-- create logger instance

  GeminiService() {
    _model = GenerativeModel(
      model: 'models/gemini-pro',
      apiKey: GEMINI_API_KEY,
    );
  }

  Future<String?> generateReply(String userPrompt) async {
    try {
      final prompt = Content.text(userPrompt);
      final response = await _model.generateContent([prompt]);
      return response.text;
    } catch (e, stackTrace) {
      _logger.severe('Error from Gemini:', e, stackTrace); // <-- use logger
      return 'Sorry, something went wrong.';
    }
  }

  Future<String> sendMessage(String text) async {
    return await generateReply(text) ?? 'Sorry, no response from AI.';
  }
}
