import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AppColors {
  AppColors._();
  static const Color white = Color.fromARGB(255, 224, 224, 224);
  static const Color black = Color(0xFF131313);
  static const Color red = Color(0xff1c9e3c);
  static const Color lightRed = Color(0xff1c9e3c);
  static const Color blueGrey = Color(0xFF607D8B);
  static const Color green = Color(0xFF21C13B);
  static const Color darkGreen = Color(0xFF4CAF50);
  static const Color yellow = Color(0xFFE7E20E);
  static const Color blue =Color(0xff1c9e3c);
  static const Color darkBlue = Color(0xff1c9e3c);
  static const Color deepOrange = Color(0xff1c9e2a);
  static const Color grey = Color(0xFF9E9E9E);
  static const LinearGradient blueGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: <Color>[darkBlue, blue],
  );
  static const LinearGradient redGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: <Color>[Color(0xff1c9e2a), Color(0xff1c9e3c)],
  );
}
