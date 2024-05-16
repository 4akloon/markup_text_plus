library markup_text_plus;

import 'package:flutter/widgets.dart';

import '../tags/markup_tags.dart';
import 'markup_style_provider.dart';

const _defaultTags = [
  BoldMarkupTag(),
  ItalicMarkupTag(),
  UnderlineMarkupTag(),
  ColorMarkupTag(),
];

/// A class which holds the style for the markup text.
class MarkupTextStyle {
  /// Constructor for a markup text style.
  MarkupTextStyle({
    List<MarkupTag> tags = const [],
    this.textStyle,
  }) : _tags = {} {
    for (final tag in [..._defaultTags, ...tags]) {
      _tags[tag.name] = tag;
    }
  }

  /// A factory method to get the [MarkupTextStyle] from the [BuildContext].
  factory MarkupTextStyle.of(BuildContext context) =>
      context
          .dependOnInheritedWidgetOfExactType<MarkupTextStyleProvider>()
          ?.style ??
      MarkupTextStyle();

  final Map<String, MarkupTag> _tags;

  /// The default text style for the markup text.
  final TextStyle? textStyle;

  /// A map of the tags and their corresponding [MarkupTag]s.
  Map<String, MarkupTag> get tags => _tags;
}
