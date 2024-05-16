import 'package:flutter/widgets.dart';

/// Base class for all markup tags.
abstract class MarkupTag {
  /// Constructor for a markup tag.
  const MarkupTag(this.name);

  /// The name of the tag. For example, 'b' for bold.
  final String name;

  /// Whether the tag is self-closing.
  bool get isSelfClosing => false;

  /// Builds the span for the tag.
  InlineSpan buildSpan(
    BuildContext context,
    List<InlineSpan> children,
    String? arg,
  );
}
