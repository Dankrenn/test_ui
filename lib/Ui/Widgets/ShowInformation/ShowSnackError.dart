import 'package:flutter/material.dart';

void ShowSnackError(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
        message,
        style: TextStyle(fontSize: 20, color: Colors.red),
      ),
      duration: Duration(seconds: 5),
    ),
  );
}
