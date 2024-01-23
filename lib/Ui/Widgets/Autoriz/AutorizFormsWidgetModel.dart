import 'package:flutter/material.dart';
import 'package:test_ui/Ui/Error/Validator.dart';

import '../../../Business_Logic/Classes/User.dart';

class AutorizFormsWidgetModel extends ChangeNotifier{
  User user = User();
  bool showPassword = false;
  String? error = null;

  void ChangeShowPassword(){
    showPassword = !showPassword;
    notifyListeners();
  }
  String? ExaminationError() {
    error = Validator.validatePassword(user.passoword);
    if (error == null) {
      error = Validator.validateEmail(user.email);
    }
    return error;
  }

  void UserVerification() {
    //проверка существования пользователя
 }
}