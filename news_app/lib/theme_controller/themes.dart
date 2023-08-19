import 'package:flutter/material.dart';

class Themes {
  static final light = ThemeData(
      backgroundColor: Colors.white,
      colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.green).copyWith(
        secondary: Colors.pink,
        brightness: Brightness.light,
      ));
  static final dark = ThemeData(
      backgroundColor: Colors.blueGrey,
      colorScheme: ColorScheme.fromSwatch(
        primarySwatch: Colors.green,
      ).copyWith(
        secondary: Colors.red,
        brightness: Brightness.light,
      ));
}
