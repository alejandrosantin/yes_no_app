import 'package:flutter/material.dart';
import 'package:yes_no_app/config/helpers/get_yes_no_answer.dart';
import 'package:yes_no_app/domain/entities/message.dart';

class ChatProvider extends ChangeNotifier {
  final ScrollController scrollController = ScrollController();

  List<Message> messageList = [
    Message(text: 'Hola Ale', fromwho: Fromwho.other),
    Message(text: 'Bienvenido', fromwho: Fromwho.other)
  ];

  Future<void> sendMessage(String text) async {
    if (text.isEmpty) return;
    messageList.add(Message(text: text, fromwho: Fromwho.me));
    notifyListeners();
    moveScrollToEnd();
    if (text.endsWith('?')) {
      await reply();
    }
  }

  Future<void> reply() async {
    final response = await GetYesNoAnswer().getAnswer();
    messageList.add(response);
    notifyListeners();
    moveScrollToEnd();
  }

  Future<void> moveScrollToEnd() async {
    await Future.delayed(const Duration(milliseconds: 100));
    scrollController.animateTo(
      scrollController.position.maxScrollExtent,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOut,
    );
  }
}
