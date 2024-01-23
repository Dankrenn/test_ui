import 'package:flutter/material.dart';
import 'package:test_ui/Ui/Widgets/Hub/Chat/ChatFormsWidget.dart';
import 'package:test_ui/Ui/Widgets/Hub/Contact/ContactFormsWidget.dart';

class HubFormsWidgetModel extends ChangeNotifier {
  int currentIndex = 0;

  final List<Widget> _tabs = [
    ChatFormsWidget(),
    ContactFormsWidget(),
  ];

  Widget get currentTab => _tabs[currentIndex];

  void changeTab(int index) {
    if( currentIndex != index)
      {
        currentIndex = index;
        notifyListeners();
      }
  }

}

