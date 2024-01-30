import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:test_ui/Ui/Error/Validator.dart';
import 'package:test_ui/Ui/Widgets/ShowInformation/ShowSnackError.dart';

import '../../../Business_Logic/Classes/User.dart';

class AutorizFormsWidgetModel extends ChangeNotifier{
  UserApp user = UserApp();
  bool showPassword = false;
  String? error = null;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  void ChangeShowPassword(){
    showPassword = !showPassword;
    notifyListeners();
  }
  String? ExaminationError() {
    error = Validator.validatePassword(user.password);
    if (error == null) {
      error = Validator.validateEmail(user.email);
    }
    return error;
  }

  void UserVerification(BuildContext context) async {
    //проверка существования пользователя
    try {
      ExaminationError();
      if(error == null){
        UserCredential userCredential = await _auth.signInWithEmailAndPassword(
          email: user.email,
          password: user.password,
        );
        // Если аутентификация прошла успешно, переходим на другой экран
        Navigator.pushNamedAndRemoveUntil(context, '/Hub', (route) => false);
      }
      else{
        ShowSnackError(context, error!);
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found' || e.code == 'wrong-password') {
        ShowSnackError(context, 'Неправильный Email или пароль',);
      }
    }
 }
}