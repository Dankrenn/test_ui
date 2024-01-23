import 'package:flutter/material.dart';
import 'package:test_ui/Business_Logic/Classes/Chat.dart';
import 'package:test_ui/Business_Logic/Classes/Dialog.dart';
import 'package:test_ui/Servises/Chat_Information.dart';

class DialogFormsWidgetModel extends ChangeNotifier {
  TextEditingController textEditingController = TextEditingController();
  String? textMessenge;

  // Method to add a message to the chat
  void addMessage(ChatTile chat ) {
    if (chat != null && textMessenge != null) {
      final newMessage = DialogChat(
        textMessenge: textMessenge!,
        isMyMessenge: true, // Assuming the message is from the user
      );
      chat!.message.add(newMessage);
      textMessenge = '';
      textEditingController.clear();
      notifyListeners();
    }
  }
}
