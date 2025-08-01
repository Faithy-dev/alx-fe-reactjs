import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import '../models/message.dart';
import '../services/gemini_service.dart';

class ChatProvider with ChangeNotifier {
  final GeminiService _geminiService;
  final Box<Message> _box = Hive.box<Message>('chatBox');

  List<Message> _messages = [];
  bool _isLoading = false;

  ChatProvider(this._geminiService) {
    _messages = _box.values.toList(); 
  }

  List<Message> get messages => _messages;
  bool get isLoading => _isLoading;

  Future<void> sendMessage(String text) async {
    _addMessage(Message(text: text, isUser: true));
    _setLoading(true);

    final reply = await _geminiService.sendMessage(text);
    _addMessage(Message(text: reply, isUser: false));

    _setLoading(false);
  }

  void _addMessage(Message msg) {
    _messages.add(msg);
    _box.add(msg);
    notifyListeners();
  }

  void _setLoading(bool val) {
    _isLoading = val;
    notifyListeners();
  }
}
