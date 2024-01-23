import 'package:flutter/material.dart';
import 'package:test_ui/Ui/Error/Validator.dart';

import '../../../../Business_Logic/Classes/User.dart';

class NewPasswordFormsWidgetModel extends ChangeNotifier{
  User user = User();
  String? error = null;

  String? ExaminationError() {
    error = Validator.validatePassword(user.passoword);
    if (error == null) {
      error = Validator.validateConfirmPassword(
          user.passoword, user.repleyPassword);
    }
    return error;
  }

  void UserUpdatePassword() {
    //Процесс изменения пароля
  }
}


