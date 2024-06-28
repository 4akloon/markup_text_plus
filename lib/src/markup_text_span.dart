library markup_text_plus;

import 'package:flutter/rendering.dart';

import 'markup_span_tree_builder.dart';
import 'style/markup_text_style.dart';

/// A text span which displays text with markup.
class MarkupTextSpan extends TextSpan {
  /// Constructor for a markup text span.
  const MarkupTextSpan({
    required String text,
    super.semanticsLabel,
    super.onEnter,
    super.onExit,
    super.locale,
    this.markupTextStyle = const MarkupTextStyle(),
  }) : _text = text;

  final String _text;

  /// The style to use for the text.
  final MarkupTextStyle markupTextStyle;

  @override
  List<InlineSpan> get children {
    final builder = MarkupSpanTreeBuilder(markupTextStyle.tags);

    return builder.buildTree(_text);
  }
}
