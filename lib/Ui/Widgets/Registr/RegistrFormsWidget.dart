import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_ui/Ui/Navigator/MainNavigator.dart';
import 'package:test_ui/Ui/Setting/ColorStyle.dart';
import 'package:test_ui/Ui/Setting/TextStyle.dart';
import 'package:test_ui/Ui/Widgets/Registr/RegistFormsWidgetModel.dart';

import '../ShowInformation/ShowSnackError.dart';

class RegistrFormsWidget extends StatelessWidget {
  const RegistrFormsWidget({super.key});

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
                  'Регистрация',
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
    return ChangeNotifierProvider<RegistFormsWidgetModel>(
      create: (contex) => RegistFormsWidgetModel(),
      child: const _DataEntryWidgetBody(),
    );
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
                NameWidget(),
                EmailWidget(),
                PasswordWidget(),
                RepleyPasswordWidget(),
              ],
            ),
            StackButtonWidget(),
          ],
        ),
      ),
    );
  }
}

class NameWidget extends StatelessWidget {
  const NameWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final model = context.watch<RegistFormsWidgetModel>();
    return TextField(
      onChanged: (value) => model?.user.name = value,
      decoration: const InputDecoration(
        hintText: 'Имя',
      ),
    );
  }
}

class EmailWidget extends StatelessWidget {
  const EmailWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final model = context.watch<RegistFormsWidgetModel>();
    return TextField(
      onChanged: (value) => model?.user.email = value,
      decoration: const InputDecoration(
        hintText: 'Email',
      ),
    );
  }
}

class PasswordWidget extends StatelessWidget {
  const PasswordWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final model = context.watch<RegistFormsWidgetModel>();
    return TextField(
      obscureText: !model!.showPassword,
      onChanged: (value) => model?.user.password = value,
      decoration: InputDecoration(
        hintText: 'Пароль',
        suffixIcon: IconButton(
          icon: Icon(
            model!.showPassword ? Icons.visibility : Icons.visibility_off,
          ),
          onPressed: () => model!.ChangeShowPassword(),
        ),
      ),
    );
  }
}

class RepleyPasswordWidget extends StatelessWidget {
  const RepleyPasswordWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final model = context.watch<RegistFormsWidgetModel>();
    return TextField(
      obscureText: !model!.configPassword,
      onChanged: (value) => model?.user.repleyPassword = value,
      decoration: InputDecoration(
        hintText: 'Повторите пароль',
        suffixIcon: IconButton(
          icon: Icon(
            model!.configPassword ? Icons.visibility : Icons.visibility_off,
          ),
          onPressed: () => model!.ChangeConfigPassword(),
        ),
      ),
    );
  }
}

class StackButtonWidget extends StatelessWidget {
  const StackButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final model = context.watch<RegistFormsWidgetModel>();
    return Positioned(
      right: 0,
      top: 0,
      bottom: 1,
      child: GestureDetector(
        onTap: () => {
          model?.SaveUser(context),
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
    return TextButton(
      onPressed: () => Navigator.pushNamedAndRemoveUntil(
          context, NavigatorRouse.autoriz, (route) => true),
      child: Text(
        'Уже есть аккаунт?',
        style: TextStyleSetting.textStyleColorBlueSize16,
      ),
    );
  }
}
