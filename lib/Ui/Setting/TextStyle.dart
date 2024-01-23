
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:test_ui/Ui/Setting/ColorStyle.dart';

  abstract class TextStyleSetting{
 static const  TextStyle textStyleColorBlueSize16 = TextStyle(
    color: Colors.blueGrey,
    fontSize: 16.0,
  );
 static const TextStyle textStyleColorWhite60Size30 = TextStyle(
   fontSize: 30,
   fontWeight: FontWeight.bold,
   color: ColorStyleSetting.colorWhite,
 );
 static const TextStyle textStyleAppbar = TextStyle(
   fontSize: 20,
   color: Colors.blueGrey,
 );
 static const  TextStyle textStyleColorsWhite60Size16 = TextStyle(
   color: ColorStyleSetting.colorWhite,
   fontSize: 16.0,
 );
}