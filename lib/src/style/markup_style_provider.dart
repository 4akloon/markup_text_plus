import 'package:flutter/widgets.dart';

import 'markup_text_style.dart';

/// A provider for the [MarkupTextStyle] to be used by the [MarkupText] widget.
class MarkupTextStyleProvider extends InheritedWidget {
  /// Constructor for a [MarkupTextStyleProvider].
  const MarkupTextStyleProvider({
    super.key,
    required super.child,
    required this.style,
  });

  /// A factory method to get the [MarkupTextStyle] from the [BuildContext].
  final MarkupTextStyle style;

  @override
  bool updateShouldNotify(MarkupTextStyleProvider oldWidget) {
    return style != oldWidget.style;
  }
}
