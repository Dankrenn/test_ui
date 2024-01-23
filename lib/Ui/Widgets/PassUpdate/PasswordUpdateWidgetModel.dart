import 'package:flutter/material.dart';
import 'package:test_ui/Ui/Error/Validator.dart';
import '../../../Business_Logic/Classes/User.dart';

class PasswordUpdateFormsWidgetModel extends ChangeNotifier{
  User user = User();
  String? error = null;

  String? ExaminationError() {
      error = Validator.validateEmail(user.email);
      return error;
  }

  void UserEmailVerification() {
    //Процесc верификации email
  }
}
