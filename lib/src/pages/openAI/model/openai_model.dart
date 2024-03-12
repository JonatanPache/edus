import 'package:edus/src/pages/openAI/repository/openai_respository.dart';
import 'package:edus/src/pages/openAI/widgets/ai_message.dart';
import 'package:edus/src/pages/openAI/widgets/loading.dart';
import 'package:edus/src/pages/openAI/widgets/user_message.dart';
import 'package:flutter/material.dart';

/// Chat Model
class ChatModel extends ChangeNotifier {
  /// List of messages.
  List<Widget> messages = [];

  /// Message list getter.
  List<Widget> get getMessages => messages;

  /// Sends chat request to OpenAI chat server.
  Future<void> sendChat(String txt) async {
    addUserMessage(txt);
    final response =
    await OpenAiRepository.sendMessage(prompt: txt);
    final text =
    (response['choices'] as List<dynamic>).map((t) =>
    (t as Map)['text'] as String,);
    //remove the last item
    messages..removeLast()
      ..add(AiMessage(text: text.first));

    notifyListeners();
  }

  /// Adds a new message to the list.
  void addUserMessage(String txt) {
    messages..add(UserMessage(text: txt))
      ..add(const Loading(text: '...'));
    notifyListeners();
  }
}