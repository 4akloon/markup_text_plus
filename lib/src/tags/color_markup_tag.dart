import 'package:flutter/widgets.dart';
import 'package:markup_text_plus/src/utils/color_parser.dart';

import 'markup_tag.dart';

/// A markup tag which changes the color of the text.
class ColorMarkupTag extends MarkupTag {
  /// Constructor for a color markup tag.
  const ColorMarkupTag() : super('color');

  @override
  InlineSpan buildSpan(
    BuildContext context,
    String text,
    List<InlineSpan> children,
    String? arg,
  ) {
    final color = arg != null ? parseColor(arg) : null;

    return TextSpan(
      children: children,
      style: TextStyle(color: color),
    );
  }
}
