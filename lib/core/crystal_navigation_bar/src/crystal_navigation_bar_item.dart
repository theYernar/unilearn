import 'package:flutter/material.dart';

/// A tab to display in a [CrystalNavigationBar]
class CrystalNavigationBarItem {
  /// An icon to display.
  final IconData icon;

  final double iconSize;

  /// An icon to display.
  final IconData? unselectedIcon;

  /// A primary color to use for this tab.
  final Color? selectedColor;

  /// The color to display when this tab is not selected.
  final Color? unselectedColor;

  CrystalNavigationBarItem({
    required this.icon,
    this.iconSize = 24.0,
    this.unselectedIcon,
    this.selectedColor,
    this.unselectedColor,
  });
}
