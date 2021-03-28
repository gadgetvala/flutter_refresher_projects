import 'package:flutter/material.dart';
import 'package:tinycolor/tinycolor.dart';

String giveMeHexCode(Color color) {
  return '#${color.value.toRadixString(16).substring(2)}';
}

Color giveMeDarkenShadeColor(String color, value) {
  return TinyColor.fromString(color).darken(value).color;
}

Color giveMeLightenShadeColor(String color, value) {
  return TinyColor.fromString(color).lighten(value).color;
}

List generateColor(String color) {
  List data = [];

  // Gerating Lightin Shade
  for (int i = 5; i >= 1; i--) {
    Color newColor = giveMeLightenShadeColor(color, i * 10);

    data.add({
      'percentage': i * 10,
      'color': newColor,
      'hexCode': giveMeHexCode(newColor)
    });
  }

  // Adding Main shade
  Color midColor = TinyColor.fromString(color).color;
  data.add({
    'percentage': 0,
    'color': TinyColor.fromString(color).color,
    'hexCode': giveMeHexCode(midColor)
  });

  // Gerating Darken Shade
  for (int i = 1; i <= 5; i++) {
    Color newColor = giveMeDarkenShadeColor(color, i * 10);
    data.add({
      'percentage': i * 10,
      'color': newColor,
      'hexCode': giveMeHexCode(newColor)
    });
  }

  return data;
}
