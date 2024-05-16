import 'dart:ui';

import 'package:flutter_test/flutter_test.dart';
import 'package:markup_text_plus/src/utils/color_parser.dart';

void main() {
  test('parseColor', () {
    expect(parseColor('FFFF0000'), equals(const Color(0xFFFF0000)));
    expect(parseColor('FF00FF00'), equals(const Color(0xFF00FF00)));
    expect(parseColor('FF0000FF'), equals(const Color(0xFF0000FF)));
    expect(parseColor('FF000000'), equals(const Color(0xFF000000)));
    expect(parseColor('FFFFFFFF'), equals(const Color(0xFFFFFFFF)));
    expect(parseColor('00AABBCC'), equals(const Color(0x00AABBCC)));
  });
}
