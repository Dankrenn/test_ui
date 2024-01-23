import 'package:flutter/material.dart';

void ShowSnackBarInformation(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
        message,
        style: TextStyle(fontSize: 20, color: Colors.grey),
      ),
      duration: Duration(seconds: 5),
    ),
  );
}