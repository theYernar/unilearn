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

final List<ColorSchemeData> deuteranomaly = [
  ColorSchemeData(text: 'Red', color: const Color(0xFFb18f2e)),
  ColorSchemeData(text: 'Orange', color: const Color(0xFFaf9e2b)),
  ColorSchemeData(text: 'Yellow', color: const Color(0xFFa59e26)),
  ColorSchemeData(text: 'Green', color: const Color(0xFF9ab4b3)),
  ColorSchemeData(text: 'Cyan', color: const Color(0xFF6590c8)),
  ColorSchemeData(text: 'Blue', color: const Color(0xFF496bbf)),
  ColorSchemeData(text: 'Purple', color: const Color(0xFF3543a1)),
  ColorSchemeData(text: 'Grey', color: const Color(0xFF7c8aaf)),
];


final List<ColorSchemeData> protanomaly = [
  ColorSchemeData(text: 'Red', color: const Color(0xFFe6cfdf)),
  ColorSchemeData(text: 'Orange', color: const Color(0xFFd0c4a0)),
  ColorSchemeData(text: 'Yellow', color: const Color(0xFFdcd968)),
  ColorSchemeData(text: 'Green', color: const Color(0xFF5a8d68)),
  ColorSchemeData(text: 'Cyan', color: const Color(0xFF4b92c0)),
  ColorSchemeData(text: 'Blue', color: const Color(0xFF4277c9)),
  ColorSchemeData(text: 'Purple', color: const Color(0xFF4a59b8)),
  ColorSchemeData(text: 'Grey', color: const Color(0xFFa2b3d3)),
];



final List<ColorSchemeData> tritanomaly = [
  ColorSchemeData(text: 'Red', color: const Color(0xFFa35557)),
  ColorSchemeData(text: 'Orange', color: const Color(0xFF9c614f)),
  ColorSchemeData(text: 'Yellow', color: const Color(0xFF9f8360)),
  ColorSchemeData(text: 'Green', color: const Color(0xFF107a7c)),
  ColorSchemeData(text: 'Cyan', color: const Color(0xFF10849c)),
  ColorSchemeData(text: 'Blue', color: const Color(0xFF628dac)),
  ColorSchemeData(text: 'Purple', color: const Color(0xFF96779e)),
  ColorSchemeData(text: 'Grey', color: const Color(0xFF7c8d9f)),
];