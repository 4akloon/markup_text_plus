import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';

import 'markup_tag.dart';

/// A markup tag which creates a link.
class LinkMarkupTag extends MarkupTag {
  /// Constructor for a link markup tag.
  const LinkMarkupTag({
    this.textColor,
  }) : super('a');

  /// The color of the text.
  final Color? textColor;

  @override
  InlineSpan buildSpan(
    BuildContext context,
    String text,
    List<InlineSpan> children,
    String? arg,
  ) {
    return TextSpan(
      text: text,
      recognizer: TapGestureRecognizer()
        ..onTap = () {
          if (arg != null) {
            canLaunchUrlString(arg).then((canLaunch) {
              if (canLaunch) {
                launchUrlString(arg);
              }
            });
          }
        },
      style: TextStyle(
        decoration: TextDecoration.underline,
        color: textColor ?? Colors.blue,
      ),
    );
  }
}
