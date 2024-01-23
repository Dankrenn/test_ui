import 'package:flutter/material.dart';
import 'package:test_ui/Business_Logic/Classes/Dialog.dart';

class ChatTile {
  final String? photoUrl; //'https://avatars.githubusercontent.com/u/37553901?v=4';
  final String username;
  final List<DialogChat> message;
  final String time;
  int unreadCount;

  ChatTile({
    required this.username,
    required this.message,
    required this.time,
    required this.unreadCount,
    required this.photoUrl,
  });
}
