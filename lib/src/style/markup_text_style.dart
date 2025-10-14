library;

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
    this.strutStyle,
    this.textAlign,
    this.textDirection,
    this.locale,
    this.softWrap,
    this.overflow,
    this.textScaler,
    this.maxLines,
    this.semanticsLabel,
    this.semanticsIdentifier,
    this.textWidthBasis,
    this.textHeightBehavior,
    this.selectionColor,
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

  /// The strut style for the markup text.
  final StrutStyle? strutStyle;

  /// The text align for the markup text.
  final TextAlign? textAlign;

  /// The text direction for the markup text.
  final TextDirection? textDirection;

  /// The locale for the markup text.
  final Locale? locale;

  /// The soft wrap for the markup text.
  final bool? softWrap;

  /// The overflow for the markup text.
  final TextOverflow? overflow;

  /// The text scaler for the markup text.
  final TextScaler? textScaler;

  /// The max lines for the markup text.
  final int? maxLines;

  /// The semantics label for the markup text.
  final String? semanticsLabel;

  /// The semantics identifier for the markup text.
  final String? semanticsIdentifier;

  /// The text width basis for the markup text.
  final TextWidthBasis? textWidthBasis;

  /// The text height behavior for the markup text.
  final TextHeightBehavior? textHeightBehavior;

  /// The selection color for the markup text.
  final Color? selectionColor;

  /// A map of the tags and their corresponding [MarkupTag]s.
  Map<String, MarkupTag> get tags {
    final map = <String, MarkupTag>{};

    for (final tag in [..._defaultTags, ..._tags]) {
      map[tag.name] = tag;
    }

    return map;
  }
}
