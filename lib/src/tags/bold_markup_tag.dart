import 'package:flutter/widgets.dart';

import 'markup_tag.dart';

/// A markup tag which makes the text bold.
class BoldMarkupTag extends MarkupTag {
  /// Constructor for a bold markup tag.
  const BoldMarkupTag() : super('b');

  @override
  InlineSpan buildSpan(
    BuildContext context,
    List<InlineSpan> children,
    String? arg,
  ) {
    return TextSpan(
      children: children,
      style: const TextStyle(fontWeight: FontWeight.bold),
    );
  }
}
