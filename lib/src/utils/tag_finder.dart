/// A class that helps in finding the position of tags in a text.
class TagFinder {
  /// A regular expression to match the beginning of a tag.
  static final _beginTagRegex = RegExp(
    r'\(([a-z_]+)(?:\s([^)]*))?\)',
  );

  /// A regular expression to match the beginning and end of a tag.
  static final _beginAndEndTagRegex = RegExp(
    r'\(([a-z_]+)(?:\s([^)]*))?\)|\(/([a-z_]+)\)',
  );

  /// Constructor for a tag finder.
  ///
  /// The [text] parameter is the text in which the tags need to be found.
  const TagFinder(this._text);

  final String _text;

  /// Finds the position of the begin tag in the given text.
  ///
  /// Returns a [BeginTagPosition] object if a begin tag is found, otherwise returns null.
  /// The [BeginTagPosition] object contains the start and end indices of the begin tag,
  /// the tag name, and an optional argument.
  ///
  /// Example usage:
  /// ```dart
  /// final tagFinder = TagFinder();
  /// final beginTagPosition = tagFinder.findBeginTag();
  /// if (beginTagPosition != null) {
  ///   print('Begin tag found at indices ${beginTagPosition.start} - ${beginTagPosition.end}');
  ///   print('Tag name: ${beginTagPosition.tagName}');
  ///   print('Argument: ${beginTagPosition.arg}');
  /// } else {
  ///   print('No begin tag found.');
  /// }
  /// ```
  BeginTagPosition? findBeginTag() {
    final match = _beginTagRegex.firstMatch(_text);

    if (match == null) return null;

    final tagName = match.group(1)!;
    final arg = match.group(2);

    return BeginTagPosition(
      start: match.start,
      end: match.end,
      tagName: tagName,
      arg: arg,
    );
  }

  /// Finds the position of the end tag in the given text.
  EndTagPosition? findEndTag(String tagName) {
    final matches = _beginAndEndTagRegex.allMatches(_text);

    final positions = matches
        .map(MarkupTagPosition.fromMatch)
        .where((p) => p.tagName == tagName)
        .toList();

    int state = 0;

    for (final position in positions) {
      if (position is BeginTagPosition) {
        state++;
      } else {
        state--;
      }

      if (state == 0) {
        return EndTagPosition(
          start: position.start,
          end: position.end,
          tagName: tagName,
        );
      }
    }

    return null;
  }
}

/// A class to represent the position of a tag in a text.
abstract class MarkupTagPosition {
  /// Constructor for a tag position.
  const MarkupTagPosition({
    required this.start,
    required this.end,
    required this.tagName,
  });

  /// A factory method to create a [MarkupTagPosition] object from a [Match].
  factory MarkupTagPosition.fromMatch(Match match) {
    final start = match.start;
    final end = match.end;

    if (match.group(1) case String tagName) {
      return BeginTagPosition(
        start: start,
        end: end,
        tagName: tagName,
      );
    } else if (match.group(3) case String tagName) {
      return EndTagPosition(
        start: start,
        end: end,
        tagName: tagName,
      );
    } else {
      throw ArgumentError('Invalid match.');
    }
  }

  /// Represents the start and end indices of a tag in a text.
  ///
  /// The [start] property represents the starting index of the tag in the text.
  /// The [end] property represents the ending index of the tag in the text.
  final int start, end;

  /// Name of the tag.
  final String tagName;
}

/// A class to represent the position of a begin tag in a text.
class BeginTagPosition extends MarkupTagPosition {
  /// Constructor for a begin tag position.
  ///
  /// The [start] parameter is the starting index of the begin tag in the text.
  /// The [end] parameter is the ending index of the begin tag in the text.
  /// The [tagName] parameter is the name of the begin tag.
  /// The [arg] parameter is an optional argument for the tag.
  const BeginTagPosition({
    required super.start,
    required super.end,
    required super.tagName,
    this.arg,
  });

  /// An optional argument for the tag.
  final String? arg;
}

/// A class to represent the position of an end tag in a text.
class EndTagPosition extends MarkupTagPosition {
  /// Constructor for an end tag position.
  ///
  /// The [start] parameter is the starting index of the end tag in the text.
  /// The [end] parameter is the ending index of the end tag in the text.
  /// The [tagName] parameter is the name of the end tag.
  const EndTagPosition({
    required super.start,
    required super.end,
    required super.tagName,
  });
}
