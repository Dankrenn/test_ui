import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../Navigator/MainNavigator.dart';
import '../../Setting/ColorStyle.dart';
import '../../Setting/TextStyle.dart';
import '../ShowInformation/ShowSnackError.dart';
import 'PasswordUpdateWidgetModel.dart';

class PasswordUpdateWidget extends StatelessWidget {
  const PasswordUpdateWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorStyleSetting.backgroundColor,
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  'Изменение пароля',
                  style: TextStyleSetting.textStyleColorWhite60Size30,
                ),
                const Padding(padding: const EdgeInsets.all(5)),
                const DataEntryWidget(),
                const AutorizFormWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class DataEntryWidget extends StatelessWidget {
  const DataEntryWidget({super.key});


  @override
  Widget build(BuildContext context) {
    return  ChangeNotifierProvider<PasswordUpdateFormsWidgetModel>(create: (context) => PasswordUpdateFormsWidgetModel() , child: _DataEntryWidgetBody(),);
  }
}
class _DataEntryWidgetBody extends StatelessWidget {
  const _DataEntryWidgetBody({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white12,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Stack(
          children: [
            Column(
              children: [
                EmailWidget(),
              ],
            ),
            StackButtonWidget(),
          ],
        ),
      ),
    );
  }
}

class EmailWidget extends StatelessWidget {
  const EmailWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final model = context.watch<PasswordUpdateFormsWidgetModel>();
    return  TextField(
      onChanged: (value) => model?.user.email = value,
      decoration: const InputDecoration(
        hintText: 'Email',
      ),
    );
  }
}

class StackButtonWidget extends StatelessWidget {
  const StackButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final model = context.watch<PasswordUpdateFormsWidgetModel>();
    return Positioned(
      right: 0,
      top: 0,
      bottom: 1,
      child: GestureDetector(
        onTap: () =>
        {
              model?.UserEmailVerification(context),
        },
        child: Container(
          decoration: const BoxDecoration(
            color: ColorStyleSetting.backgroundColor,
            shape: BoxShape.circle,
          ),
          padding: const EdgeInsets.all(10),
          child: const Icon(
            Icons.play_arrow,
            color: Colors.white60,
          ),
        ),
      ),
    );
  }
}

class AutorizFormWidget extends StatelessWidget {
  const AutorizFormWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return  TextButton(
      onPressed: () =>  Navigator.pushNamedAndRemoveUntil(context, NavigatorRouse.autoriz, (route) => true),
      child: Text(
        'Назад',
        style: TextStyleSetting.textStyleColorBlueSize16,
      ),
    );
  }
}

