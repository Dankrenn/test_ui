
import 'package:flutter/material.dart';
import 'package:test_ui/Ui/Widgets/Hub/Chat/DialogFormsWidget/DialogFormsWidget.dart';
import 'package:test_ui/Ui/Widgets/Hub/HubFormsWidget.dart';
import 'package:test_ui/Ui/Widgets/PassUpdate/PasswordUpdateWidget.dart';

import '../Widgets/Autoriz/AutorizFormsWidget.dart';
import '../Widgets/Registr/RegistrFormsWidget.dart';

abstract class NavigatorRouse {
  static const registr = "/";
  static const autoriz = "/Autoriz";
  static const verificationEmail = "/Autoriz/PassUpdate";
  static const hub = "/Hub";
  static const passUpdate = "/Autoriz/PassUpdate/NewPass";
  static const dialog = "/Hub/Dialog";
}

class MainNavigator {
  String initialRoute = NavigatorRouse.autoriz;

  Map<String, WidgetBuilder> routes = {
    NavigatorRouse.autoriz: (context) => AutorizFormsWidget(),
    NavigatorRouse.registr: (context) => RegistrFormsWidget(),
    NavigatorRouse.verificationEmail: (context) => PasswordUpdateWidget(),
    NavigatorRouse.hub: (context) => HubFormsWidget(),
    NavigatorRouse.dialog: (context) => DialogFormsWidget(),
  };
}
