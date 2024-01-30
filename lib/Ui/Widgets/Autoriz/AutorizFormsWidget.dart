import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_ui/Ui/Setting/TextStyle.dart';
import 'package:test_ui/Ui/Widgets/Autoriz/AutorizFormsWidgetModel.dart';
import '../../Navigator/MainNavigator.dart';
import '../../Setting/ColorStyle.dart';
import '../ShowInformation/ShowSnackError.dart';


class AutorizFormsWidget extends StatelessWidget {
  const AutorizFormsWidget({super.key});

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
                  'Авторизация',
                  style: TextStyleSetting.textStyleColorWhite60Size30,
                ),
                const Padding(padding: const EdgeInsets.all(5)),
                const DataEntryWidget(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const RegistrFormWidget(),
                    const PasswordUpdateFormWidget(),
                  ],
                ),
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
    return ChangeNotifierProvider<AutorizFormsWidgetModel>(
      create: (context) => AutorizFormsWidgetModel(),
      child: _DataEntryWidgetBody(),
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
      child: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: Stack(
          children: [
            Column(
              children: [
                EmailWidget(),
                PasswordWidget(),
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
    final model = context.watch<AutorizFormsWidgetModel>();
    return  TextField(
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
    final model = context.watch<AutorizFormsWidgetModel>();
    return  TextField(
      obscureText: !model!.showPassword,
      onChanged: (value) => model?.user.password = value, //Дописать проверку на пароль
      decoration: InputDecoration(
        hintText: 'Пароль',
        suffixIcon: IconButton(
          icon: Icon(
            model!.showPassword? Icons.visibility : Icons.visibility_off,
          ),
          onPressed: () => model!.ChangeShowPassword(),
        ),
      ),
    );
  }
}

class StackButtonWidget extends StatelessWidget {
  const StackButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final model = context.watch<AutorizFormsWidgetModel>();
    return Positioned(
      right: 0,
      top: 0,
      bottom: 1,
      child: GestureDetector(
        onTap: () =>
        {
          model?.UserVerification(context),
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

class RegistrFormWidget extends StatelessWidget {
  const RegistrFormWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return  TextButton(
      onPressed: () =>  Navigator.pushNamedAndRemoveUntil(context, NavigatorRouse.registr, (route) => true),
      child: Text(
        'Еще нет аккаунта?',
        style: TextStyleSetting.textStyleColorBlueSize16,
      ),
    );
  }
}

class PasswordUpdateFormWidget extends StatelessWidget {
  const PasswordUpdateFormWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return  TextButton(
      onPressed: () =>  Navigator.pushNamedAndRemoveUntil(context, NavigatorRouse.verificationEmail, (route) => true),
      child: Text(
        'Забыли пароль?',
        style: TextStyleSetting.textStyleColorBlueSize16,
      ),
    );
  }
}


