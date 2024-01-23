import 'package:flutter/material.dart';

import '../../../Business_Logic/Classes/User.dart';
import '../../Error/Validator.dart';
import '../ShowInformation/ShowSnackError.dart';

class RegistFormsWidgetModel extends ChangeNotifier {
  User user = User();
  bool showPassword = false;
  bool configPassword = false;
  String? error = null;

  void ChangeShowPassword() {
    showPassword = !showPassword;
    notifyListeners();
  }

  void ChangeConfigPassword() {
    configPassword = !configPassword;
    notifyListeners();
  }

  String? ExaminationError() {
    error = Validator.validateName(user.name);
    if (error == null) {
      error = Validator.validatePassword(user.passoword);
    }
    if (error == null) {
      error = Validator.validateEmail(user.email);
    }
    if (error == null) {
      error = Validator.validateConfirmPassword(
          user.passoword, user.repleyPassword);
    }
    return error;
  }

  void SaveUser() {
    //сохранение пользователя
  }
}