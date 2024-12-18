import 'package:flutter/material.dart';

class ColorSchemeData {
  final String text;
  final Color color;

  ColorSchemeData({required this.text, required this.color});
}

final List<ColorSchemeData> defaultColor = [
  ColorSchemeData(text: 'Red', color: Colors.red),
  ColorSchemeData(text: 'Orange', color: Colors.orange),
  ColorSchemeData(text: 'Yellow', color: Colors.yellow),
  ColorSchemeData(text: 'Green', color: Colors.green),
  ColorSchemeData(text: 'Cyan', color: Colors.cyan),
  ColorSchemeData(text: 'Blue', color: Colors.blue),
  ColorSchemeData(text: 'Purple', color: Colors.purple),
  ColorSchemeData(text: 'Grey', color: Colors.grey),
];
