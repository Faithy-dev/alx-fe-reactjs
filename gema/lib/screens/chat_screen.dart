import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/chat_provider.dart';
import '../services/voice_service.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _controller = TextEditingController();
  final VoiceService _voiceService = VoiceService();

  void _send() {
    final text = _controller.text.trim();
    if (text.isEmpty) return;

    Provider.of<ChatProvider>(context, listen: false).sendMessage(text);
    _controller.clear();
  }

  void _voiceInput() async {
    final spokenText = await _voiceService.listenOnce();
    if (spokenText.isNotEmpty) {
      Provider.of<ChatProvider>(context, listen: false).sendMessage(spokenText);
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final chatProvider = Provider.of<ChatProvider>(context);

    return Scaffold(
      appBar: AppBar(title: const Text('Gema 🟡')),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: chatProvider.messages.length,
                itemBuilder: (context, index) {
                  final msg = chatProvider.messages[index];
                  return Container(
                    alignment: msg.isUser
                        ? Alignment.centerRight
                        : Alignment.centerLeft,
                    padding: const EdgeInsets.all(10),
                    margin:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 8),
                    decoration: BoxDecoration(
                      color: msg.isUser ? Colors.yellow[700] : Colors.grey[800],
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      msg.text,
                      style: TextStyle(
                        color: msg.isUser ? Colors.black : Colors.white,
                      ),
                    ),
                  );
                },
              ),
            ),
            if (chatProvider.isLoading)
              const Padding(
                padding: EdgeInsets.all(8),
                child: CircularProgressIndicator(color: Colors.yellow),
              ),
            Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.mic, color: Colors.yellow),
                  onPressed: _voiceInput,
                ),
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: const InputDecoration(hintText: 'Ask Gema...'),
                    onSubmitted: (_) => _send(),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.send, color: Colors.yellow),
                  onPressed: _send,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
