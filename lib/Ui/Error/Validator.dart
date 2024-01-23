abstract class Validator {
  static String? validateName(String value) {
    if (value.isEmpty) {
      return 'Введите имя';
    }
    return null;
  }

  static String? validateEmail(String value) {
    if (value.isEmpty) {
      return 'Введите email';
    } else if (!RegExp(r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$').hasMatch(value)) {
      return 'Неверный формат email';
    }
    return null;
  }

  static String? validatePassword(String value) {
    if (value.isEmpty) {
      return 'Введите пароль';
    } else if (value.length < 8) {
      return 'Пароль должен быть больше 8 символов';
    } else if (!RegExp(r'^(?=.*[a-zA-Z])(?=.*\d)(?=.*[!@#$%^&*()_+]).{8,}$').hasMatch(value)) {
      return 'Пароль должен содержать хотя бы одну букву, одну цифру и один специальный символ.';
    }
    return null;
  }

  static String? validateConfirmPassword(String password, String confirmPassword) {
    if (confirmPassword.isEmpty) {
      return 'Пожалуйста, подтвердите свой пароль';
    } else if (password != confirmPassword) {
      return 'Пароли не совпадают';
    }
    return null;
  }
}