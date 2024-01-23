import 'package:flutter/material.dart';
import 'package:flutter_profile_picture/flutter_profile_picture.dart';
import 'package:provider/provider.dart';
import 'package:test_ui/Ui/Setting/ColorStyle.dart';
import 'package:test_ui/Ui/Setting/TextStyle.dart';
import 'package:test_ui/Ui/Widgets/Hub/Chat/ChatFormsWidgetModel.dart';

import '../../../Navigator/MainNavigator.dart';

class ChatFormsWidget extends StatelessWidget {
  const ChatFormsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ChatFormsWidgetModel>(
      create: (context) => ChatFormsWidgetModel(),
      child: _ChatFormsWidget(),
    );
  }
}


class _ChatFormsWidget extends StatelessWidget {
  const _ChatFormsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final model = context.watch<ChatFormsWidgetModel>();
    return Scaffold(
      backgroundColor: ColorStyleSetting.backgroundColor,
      appBar: AppBar(
        backgroundColor: ColorStyleSetting.backgroundColor,
        actions: [
          IconAppBarSearch(),
        ],
        title: TextAppBar()
      ),
      body: ListView.builder(
        itemCount: model.chat.chat.length,
        itemBuilder: (BuildContext context, int index) {
          return ChatTile(index);
        },
      ),
    );
  }
}

class IconAppBarSearch extends StatelessWidget {
  const IconAppBarSearch({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.search_rounded, color: ColorStyleSetting.colorGray,size: 25 ,),
      onPressed: () {},
    );
  }
}
class TextAppBar extends StatelessWidget {
  const TextAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return const  Text('Чат пользователей', style: TextStyleSetting.textStyleAppbar,);
  }
}




class ChatTile extends StatelessWidget {
  final int index;
  const ChatTile(this.index, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = context.watch<ChatFormsWidgetModel>();
    return GestureDetector(
      onTap: ()  {
        model.SetIndexChat(index);
        Navigator.pushNamedAndRemoveUntil(
          context,
          NavigatorRouse.dialog,
              (route) => true,
          arguments: {'chat': model.chat.chat[index]}, // передаем имя пользователя
        );
      },
      child: Column(
        children: [
          ListTile(
            leading: CircleAvatar(
              child: ProfilePicture(
                name: model.chat.chat[index].username,
                radius: 31,
                fontsize: 21,
                tooltip: true,
                img: model.chat.chat[index].photoUrl,
              ),
            ),
            title: Text(
              model.chat.chat[index].username,
              style: TextStyleSetting.textStyleColorsWhite60Size16,
            ),
            subtitle: Text(
              model.chat.chat[index].message[0].textMessenge,
              style: TextStyleSetting.textStyleColorsWhite60Size16,
            ),
            trailing: UnreadMessagesWidget(index),
          ),
          Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: ColorStyleSetting.colorsBlack,
              ),
            ),
          )
        ],
      ),
    );
  }
}

class UnreadMessagesWidget extends StatelessWidget {
  final int index;
  const UnreadMessagesWidget(this.index, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = context.watch<ChatFormsWidgetModel>();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          model.chat.chat[index].time,
          style: TextStyle(color: ColorStyleSetting.colorGray),
        ),
        Padding(padding: EdgeInsets.all(5)),
        if (model.chat.chat[index].unreadCount > 0)
          Container(
            padding: EdgeInsets.all(5),
            decoration: BoxDecoration(
              color: ColorStyleSetting.colorBlue,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Text(
              model.chat.chat[index].unreadCount.toString(),
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
      ],
    );
  }
}
