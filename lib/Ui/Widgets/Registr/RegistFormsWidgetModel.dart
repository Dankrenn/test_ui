import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:test_ui/Ui/Navigator/MainNavigator.dart';

import '../../../Business_Logic/Classes/User.dart';
import '../../Error/Validator.dart';
import '../ShowInformation/ShowSnackError.dart';

class RegistFormsWidgetModel extends ChangeNotifier {
  UserApp user = UserApp();
  bool showPassword = false;
  bool configPassword = false;
  String? error = null;
  final FirebaseAuth _auth = FirebaseAuth.instance;

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
      error = Validator.validatePassword(user.password);
    }
    if (error == null) {
      error = Validator.validateEmail(user.email);
    }
    if (error == null) {
      error = Validator.validateConfirmPassword(
          user.password, user.repleyPassword);
    }
    return error;
  }

  void SaveUser(BuildContext context) async {
    try {
      ExaminationError();
      if(error == null){
        //сохранение пользователя
        UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
          email: user.email,
          password: user.password,
        );
        //открытие рабочей сессии с данным пользователем
        User? firebaseUser = userCredential.user;
        if (firebaseUser != null) {
          await firebaseUser.updateProfile(displayName: user.name);
          Navigator.pushNamedAndRemoveUntil(
              context, NavigatorRouse.hub, (route) => false);
        }
      }
      else{
        ShowSnackError(context, error!);
      }
    } catch (e) {}
  }
}