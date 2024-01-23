import 'package:flutter/material.dart';
import 'Ui/Navigator/MainNavigator.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: MainNavigator().initialRoute,
      routes: MainNavigator().routes,
    );
  }
}
