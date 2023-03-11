import '/data/entities/modals/chat_modal.dart';
import '/data/entities/services/api_service.dart';
import 'package:flutter/material.dart';

class ChatProvider with ChangeNotifier {
  List<ChatModal> _chatList = [];

  List<ChatModal> get getChatList => _chatList;

  void addUserMessage({required String msg}) {
    _chatList.add(ChatModal(msg: msg, chatIndex: 0));
    notifyListeners();
  }

  Future<void> sendMessageAndGetAnswers(
      {required String msg, required String modelId}) async {
    _chatList
        .addAll(await ApiService.sendMessage(message: msg, modelId: modelId));
    notifyListeners();
  }
}