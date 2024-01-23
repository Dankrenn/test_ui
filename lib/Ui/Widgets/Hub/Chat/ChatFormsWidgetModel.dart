import 'package:flutter/material.dart';
import 'package:test_ui/Business_Logic/Classes/Chat.dart';
import 'package:test_ui/Servises/Chat_Information.dart';

class ChatFormsWidgetModel extends ChangeNotifier {
  ChatServises chat = ChatServises();


  void SetIndexChat(int index) {
    chat.IndexChat = index;
  }
}
