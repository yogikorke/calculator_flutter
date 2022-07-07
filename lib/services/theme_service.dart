import 'package:flutter/material.dart';

const Color colorBlueDark = Color(0xFF22252e);
const Color colorBlue = Color(0xFF292D36);
const Color colorRed = Color(0xFFD76061);
const Color colorGreen = Color(0xFF3CF0CC);

TextStyle kTextStyle(double size, Color color) {
  return TextStyle(
    color: color,
    fontSize: size,
    fontWeight: FontWeight.bold,
  );
}
