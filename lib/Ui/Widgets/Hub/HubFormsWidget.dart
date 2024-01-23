import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_ui/Ui/Setting/ColorStyle.dart';
import 'package:test_ui/Ui/Setting/TextStyle.dart';
import 'package:test_ui/Ui/Widgets/Hub/HubFormsWidgetModel.dart';

class HubFormsWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        backgroundColor: ColorStyleSetting.backgroundColor,
        body: TabBar(),
      ),
    );
  }
}

class TabBar extends StatelessWidget {
  const TabBar({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<HubFormsWidgetModel>(
        create: (context) => HubFormsWidgetModel(),
        child: const _TabBarWidgetBody());
  }
}

class _TabBarWidgetBody extends StatelessWidget {
  const _TabBarWidgetBody({super.key});

  @override
  Widget build(BuildContext context) {
    final model = context.watch<HubFormsWidgetModel>();
    return Scaffold(
      body: model?.currentTab,
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: ColorStyleSetting.colorBlue,
        currentIndex: model!.currentIndex,
        onTap: (index) => model?.changeTab(index),
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.chat,
            ),
            label: 'Чат',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.contact_emergency,
            ),
            label: 'Профиль',
          ),
        ],
      ),
    );
  }
}
