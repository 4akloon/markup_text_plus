import 'package:flutter/widgets.dart';

import 'markup_tag.dart';

/// A markup tag which underlines the text.
class UnderlineMarkupTag extends MarkupTag {
  /// Constructor for an underline markup tag.
  const UnderlineMarkupTag() : super('u');

  @override
  InlineSpan buildSpan(
    BuildContext context,
    List<InlineSpan> children,
    String? arg,
  ) {
    return TextSpan(
      children: children,
      style: const TextStyle(decoration: TextDecoration.underline),
    );
  }
}
