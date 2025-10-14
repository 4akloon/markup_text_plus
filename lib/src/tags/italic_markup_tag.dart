import 'package:flutter/widgets.dart';

import 'markup_tag.dart';

/// A markup tag which makes the text italic.
class ItalicMarkupTag extends MarkupTag {
  /// Constructor for an italic markup tag.
  const ItalicMarkupTag() : super('i');

  @override
  InlineSpan buildSpan(String text, List<InlineSpan> children, String? arg) {
    return TextSpan(
      children: children,
      style: const TextStyle(fontStyle: FontStyle.italic),
    );
  }
}
