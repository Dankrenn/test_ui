import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:test_ui/Ui/Error/Validator.dart';
import 'package:test_ui/Ui/Navigator/MainNavigator.dart';
import 'package:test_ui/Ui/Widgets/ShowInformation/ShowSnackError.dart';
import 'package:test_ui/Ui/Widgets/ShowInformation/ShowSnackInformation.dart';
import '../../../Business_Logic/Classes/User.dart';

class PasswordUpdateFormsWidgetModel extends ChangeNotifier{
  UserApp user = UserApp();
  String? error = null;

  String? ExaminationError() {
      error = Validator.validateEmail(user.email);
      return error;
  }

  void UserEmailVerification(BuildContext context) async {
    //Процесc верификации email если пользователь существует то пересылает на новый экран
    try{
      ExaminationError();
      if(error == null)
      {
          // Пытаемся получить информацию о методах входа для указанной почты
          var signInMethods = await FirebaseAuth.instance.fetchSignInMethodsForEmail(user.email);
          if(signInMethods.isEmpty){
            await FirebaseAuth.instance.sendPasswordResetEmail(email: user.email);
            ShowSnackBarInformation(context, "Сейчас вам придет сообщение на почту,ожидайте...");
          }
          else{
            ShowSnackError(context, "Пользователя с такой почтой не существует");
          }
      }
      else{
        ShowSnackError(context, error!);
      }
    }
    catch(e){}
  }
}
