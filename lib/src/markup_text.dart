library markup_text_plus;

import 'package:flutter/material.dart';

import 'markup_span_tree_builder.dart';
import 'style/markup_text_style.dart';

/// A widget which displays text with markup.
class MarkupText extends StatelessWidget {
  /// The text to display.
  final String text;

  /// The style to use for the text.
  final MarkupTextStyle? style;

  /// Constructor for a markup text widget.
  const MarkupText(
    this.text, {
    super.key,
    this.style,
  });

  @override
  Widget build(BuildContext context) {
    final currentStyle = style ?? MarkupTextStyle.of(context);

    final builder = MarkupSpanTreeBuilder(context, currentStyle.tags);
    final children = builder.buildTree(text);

    return RichText(
      text: TextSpan(
        children: children,
        style: currentStyle.textStyle ?? DefaultTextStyle.of(context).style,
      ),
    );
  }
}
