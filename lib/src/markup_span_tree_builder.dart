import 'package:flutter/widgets.dart';

import 'tags/markup_tag.dart';
import 'utils/tag_finder.dart';

/// A class which builds the tree of [InlineSpan]s from the markup text.
class MarkupSpanTreeBuilder {
  /// Constructor for a markup spine tree builder.
  MarkupSpanTreeBuilder(this.context, this.tags);

  /// The build context to use for building the tree.
  final BuildContext context;

  /// A map of the tags and their corresponding [MarkupTag]s.
  final Map<String, MarkupTag> tags;

  /// Builds the tree of [InlineSpan]s from the given text.
  List<InlineSpan> buildTree(String text) {
    final List<InlineSpan> children = [];

    while (text.isNotEmpty) {
      final finder = TagFinder(text);
      final beginTagPosition = finder.findBeginTag();

      if (beginTagPosition
          case BeginTagPosition(
            :final tagName,
            :final arg,
            :final start,
          )) {
        if (start == 0) {
          final tag = tags[tagName];
          if (tag case MarkupTag(:final isSelfClosing, :final buildSpan)) {
            if (!isSelfClosing) {
              final endTagPosition = finder.findEndTag();

              if (endTagPosition != null) {
                final innerText = text.substring(
                  beginTagPosition.end,
                  endTagPosition.start,
                );
                final innerChildren = buildTree(innerText);

                children.add(buildSpan(context, innerChildren, arg));
                text = text.substring(endTagPosition.end);
              } else {
                final innerText = text.substring(beginTagPosition.end);
                final innerChildren = buildTree(innerText);

                children.add(buildSpan(context, innerChildren, arg));
                text = '';
              }
            } else {
              children.add(buildSpan(context, [], arg));
              text = text.substring(beginTagPosition.end);
            }
          } else {
            children.add(TextSpan(text: text));
            text = '';
          }
        } else {
          children.add(TextSpan(text: text.substring(0, start)));
          text = text.substring(start);
        }
      } else {
        children.add(TextSpan(text: text));
        text = '';
      }
    }

    return children;
  }
}
