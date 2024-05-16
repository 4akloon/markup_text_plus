import 'package:flutter/rendering.dart';

/// Parses a hexadecimal color string into a [Color].
/// For example, 'FFFF0000' will return red.
Color parseColor(String color) {
  try {
    return Color(int.parse(color, radix: 16));
  } catch (error, stackTrace) {
    throw Exception(
      'Failed to parse color: $color'
      'Color must be a hexadecimal number, e.g. "FFFFFFFF".'
      '$error\n$stackTrace',
    );
  }
}
