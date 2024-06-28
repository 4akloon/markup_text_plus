library markup_text_plus;

import 'package:flutter/widgets.dart';

import '../tags/markup_tags.dart';
import 'markup_style_provider.dart';

const _defaultTags = [
  BoldMarkupTag(),
  ItalicMarkupTag(),
  UnderlineMarkupTag(),
  ColorMarkupTag(),
  LinkMarkupTag(),
];

/// A class which holds the style for the markup text.
class MarkupTextStyle {
  /// Constructor for a markup text style.
  const MarkupTextStyle({
    List<MarkupTag> tags = const [],
    this.textStyle,
  }) : _tags = tags;

  /// A factory method to get the [MarkupTextStyle] from the [BuildContext].
  factory MarkupTextStyle.of(BuildContext context) =>
      context
          .dependOnInheritedWidgetOfExactType<MarkupTextStyleProvider>()
          ?.style ??
      const MarkupTextStyle();

  final List<MarkupTag> _tags;

  /// The default text style for the markup text.
  final TextStyle? textStyle;

  /// A map of the tags and their corresponding [MarkupTag]s.
  Map<String, MarkupTag> get tags {
    final map = <String, MarkupTag>{};

    for (final tag in [..._defaultTags, ..._tags]) {
      map[tag.name] = tag;
    }

    return map;
  }
}
