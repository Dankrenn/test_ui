import 'package:test_ui/Business_Logic/Classes/Chat.dart';
import 'package:test_ui/Business_Logic/Classes/Dialog.dart';

 class ChatServises{
   int IndexChat =0;
  List<ChatTile> chat = [
    ChatTile(
      username: 'DANIIL',
      message:[
        DialogChat(isMyMessenge: false, textMessenge: 'Привет'),
    DialogChat(isMyMessenge: true, textMessenge: 'Привет'),
    DialogChat(isMyMessenge: false, textMessenge: 'Как ты'),
    DialogChat(isMyMessenge: true, textMessenge: 'Хорошо'),],
      time: '12:24',
      unreadCount: 0,
      photoUrl: null,
    ),
    ChatTile(
      username: 'vab',
      message:[
        DialogChat(isMyMessenge: false, textMessenge: 'куку'),
      DialogChat(isMyMessenge: true, textMessenge: 'Привет'),
      DialogChat(isMyMessenge: false, textMessenge: 'Как ты'),
      DialogChat(isMyMessenge: true, textMessenge: 'Хорошо'),],
      time: '12:26',
      unreadCount: 1,
      photoUrl: null,
    ),
    ChatTile(
      username: 'sasa',
      message: [
        DialogChat(isMyMessenge: false, textMessenge: 'хааай'),
        DialogChat(isMyMessenge: true, textMessenge: 'Привет'),
        DialogChat(isMyMessenge: false, textMessenge: 'Как ты'),
        DialogChat(isMyMessenge: true, textMessenge: 'Хорошо'),],
      time: '12:40',
      unreadCount: 24,
      photoUrl: null,
    ),
    ChatTile(
      username: 'hell',
      message: [
        DialogChat(isMyMessenge: false, textMessenge: 'dddddd'),
        DialogChat(isMyMessenge: true, textMessenge: 'Привет'),
        DialogChat(isMyMessenge: false, textMessenge: 'Как ты'),
        DialogChat(isMyMessenge: true, textMessenge: 'Хорошо'),],
      time: '13:10',
      unreadCount: 1,
      photoUrl: null,
    ),
  ];
}