import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../Navigator/MainNavigator.dart';
import '../../../Setting/ColorStyle.dart';
import '../../../Setting/TextStyle.dart';
import '../../ShowInformation/ShowSnackError.dart';
import '../../ShowInformation/ShowSnackInformation.dart';
import 'NewPasswordFormsWidgetModel.dart';

class NewPasswordFormsWidget extends StatelessWidget {
  const NewPasswordFormsWidget({super.key});

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
    return ChangeNotifierProvider(
      create: (context) => NewPasswordFormsWidgetModel(),
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
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Stack(
          children: [
            Column(
              children: [
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

class PasswordWidget extends StatelessWidget {
  const PasswordWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final model = context.watch<NewPasswordFormsWidgetModel>();
    return TextField(
      onChanged: (value) => model?.user.passoword = value,
      decoration: InputDecoration(
        hintText: 'Пароль',
      ),
    );
  }
}

class RepleyPasswordWidget extends StatelessWidget {
  const RepleyPasswordWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final model = context.watch<NewPasswordFormsWidgetModel>();
    return TextField(
      onChanged: (value) => model?.user.repleyPassword = value,
      decoration: InputDecoration(
        hintText: 'Повторите пароль',
      ),
    );
  }
}

class StackButtonWidget extends StatelessWidget {
  const StackButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final model = context.watch<NewPasswordFormsWidgetModel>();
    return Positioned(
      right: 0,
      top: 0,
      bottom: 1,
      child: GestureDetector(
        onTap: () => {
          model?.ExaminationError(),
          if (model?.error != null)
            {
              ShowSnackError(context, model!.error!),
            }
          else
            {
              model?.UserUpdatePassword(),
              ShowSnackBarInformation(context, "Пароль изменен"),
            }
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
        'Назад',
        style: TextStyleSetting.textStyleColorBlueSize16,
      ),
    );
  }
}
