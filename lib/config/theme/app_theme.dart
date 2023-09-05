import 'package:flutter/material.dart';

const Color _customColor = Color.fromARGB(255, 80, 0, 0);

const List<Color> _colorThemes = [
  _customColor,
  Colors.blue,
  Colors.teal,
  Colors.green,
  Colors.yellow,
  Colors.orange,
  Colors.pink,
];

class AppTheme {
  final int selectedColor;

  AppTheme({
    this.selectedColor = 0,
  }) : assert(selectedColor >= 0 && selectedColor < _colorThemes.length,
            'selectedColor must be between 0 and ${_colorThemes.length - 1}');

  ThemeData get themeData => ThemeData(
        useMaterial3: true,
        colorSchemeSeed: _colorThemes[selectedColor],
        //brightness: Brightness.dark,
      );
}
