// theme untuk keseluruhan project

import 'package:flutter/material.dart';

@immutable
class AppTheme {
  static ThemeData custom({
    Color? primary = const Color(0xFF03946D),
    Color? secondary = const Color(0xFF48BF91),
    Color? error = Colors.red,
    Color? surface = Colors.white,
    Color? background = Colors.white,
    Brightness? brightness = Brightness.light,
    Color? onPrimary = Colors.white,
    Color? onSecondary = Colors.white,
    Color? onError = Colors.white,
    Color? onSurface = Colors.black,
    Color? onBackground = Colors.black,
  }) {
    return ThemeData(
      colorScheme: ColorScheme(
        primary: primary!,
        secondary: secondary!,
        error: error!,
        surface: surface!,
        background: background!,
        brightness: brightness!,
        onPrimary: onPrimary!,
        onSecondary: onSecondary!,
        onBackground: onBackground!,
        onError: onError!,
        onSurface: onSurface!,
      ),
    );
  }
}

//text
const TextStyle h1 =
    TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold, color: Colors.white);
const TextStyle title = TextStyle(fontSize: 16.0, color: Colors.white);

const TextStyle subtitle =
    TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold, color: Colors.white);

const TextStyle titleBlack = TextStyle(
  fontSize: 16.0,
  fontWeight: FontWeight.bold,
  color: Color.fromARGB(221, 43, 43, 43),
);

const TextStyle subTitleBlack = TextStyle(
  fontSize: 14.0,
  fontWeight: FontWeight.bold,
  color: Color.fromARGB(221, 43, 43, 43),
);
