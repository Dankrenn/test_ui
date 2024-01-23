import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_ui/Business_Logic/Classes/Chat.dart';
import 'package:test_ui/Servises/Chat_Information.dart';
import 'package:test_ui/Ui/Setting/ColorStyle.dart';
import 'package:test_ui/Ui/Widgets/Hub/Chat/DialogFormsWidget/DialogFormsWidgetModel.dart';

class DialogFormsWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic>? args =
    ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;
    ChatTile? chat = args?['chat'];

    return ChangeNotifierProvider<DialogFormsWidgetModel>(
      create: (context) => DialogFormsWidgetModel(),
      child: _DialogFormsWidgetBody(chat: chat),
    );
  }
}

class _DialogFormsWidgetBody extends StatelessWidget {
  final ChatTile? chat;
   _DialogFormsWidgetBody({super.key,  this.chat});

  @override
  Widget build(BuildContext context) {
    final model = context.watch<DialogFormsWidgetModel>();
    return Scaffold(
      backgroundColor: ColorStyleSetting.backgroundColor,
      appBar: AppBar(
        backgroundColor: ColorStyleSetting.backgroundColor,
        title: Text(chat!.username!),
      ),
      body: ListView.builder(
        itemCount: chat?.message.length,
        itemBuilder: (BuildContext context, int index) {
          return _buildMessage(chat as ChatTile,index);
        },
      ),
      bottomNavigationBar: BottomAppBar(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Row(
            children: [
              IconButton(
                icon: Icon(Icons.add),
                onPressed: () {},
              ),
              Expanded(
                child: TextField(
                  controller: model.textEditingController,
                  onChanged: (value) => model.textMessenge = value,
                  decoration: InputDecoration.collapsed(
                    hintText: 'Напишите сообщение...',
                  ),
                ),
              ),
              IconButton(
                  icon: Icon(Icons.send),
                  onPressed: () => model.addMessage(chat!),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _buildMessage extends StatelessWidget {
  final int index;
  final ChatTile chat;

  const _buildMessage(this.chat,this.index, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = context.watch<DialogFormsWidgetModel>();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Align(
        alignment: chat.message[index].isMyMessenge
            ? Alignment.centerRight
            : Alignment.centerLeft,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            padding: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color: chat.message[index].isMyMessenge
                  ? ColorStyleSetting.colorsdialogMyMessenge
                  : Colors.blueGrey,
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Text(
              chat.message[index].textMessenge,
              style: TextStyle(
                  color: chat.message[index].isMyMessenge
                      ? Colors.white
                      : Colors.black, fontSize: 16),
            ),
          ),
        ),
      ),
    );
  }
}
