import 'package:flutter_test/flutter_test.dart';
import 'package:markup_text_plus/src/utils/tag_finder.dart';

void main() {
  group('TagFinder', () {
    test('findBeginTag no tag', () {
      const tagFinder = TagFinder('No tag here');
      final beginTagPosition = tagFinder.findBeginTag();

      expect(beginTagPosition, isNull);
    });

    test('findBeginTag with tag at 0', () {
      const tagFinder = TagFinder('(tag)Some text');
      final beginTagPosition = tagFinder.findBeginTag();

      expect(beginTagPosition, isNotNull);
      expect(beginTagPosition!.start, equals(0));
      expect(beginTagPosition.end, equals(5));
      expect(beginTagPosition.tagName, equals('tag'));
      expect(beginTagPosition.arg, isNull);
    });

    test('findBeginTag with tag at 5', () {
      const tagFinder = TagFinder('Some (tag)text');
      final beginTagPosition = tagFinder.findBeginTag();

      expect(beginTagPosition, isNotNull);
      expect(beginTagPosition!.start, equals(5));
      expect(beginTagPosition.end, equals(10));
      expect(beginTagPosition.tagName, equals('tag'));
      expect(beginTagPosition.arg, isNull);
    });

    test('findBeginTag with tag and argument', () {
      const tagFinder = TagFinder('(tag arg)Some text');
      final beginTagPosition = tagFinder.findBeginTag();

      expect(beginTagPosition, isNotNull);
      expect(beginTagPosition!.start, equals(0));
      expect(beginTagPosition.end, equals(9));
      expect(beginTagPosition.tagName, equals('tag'));
      expect(beginTagPosition.arg, equals('arg'));
    });
    test('findBeginTag with unmatched tag', () {
      const tagFinder = TagFinder('(tag Some text');
      final beginTagPosition = tagFinder.findBeginTag();

      expect(beginTagPosition, isNull);
    });
    test('findBeginTag with unmatched tag', () {
      const tagFinder = TagFinder('(t2ag Some');
      final beginTagPosition = tagFinder.findBeginTag();

      expect(beginTagPosition, isNull);
    });

    test('findEndTag no tag', () {
      const tagFinder = TagFinder('No tag here');
      final endTagPosition = tagFinder.findEndTag();

      expect(endTagPosition, isNull);
    });

    test('findEndTag with tag at 0', () {
      const tagFinder = TagFinder('(/tag)Some text');
      final endTagPosition = tagFinder.findEndTag();

      expect(endTagPosition, isNotNull);
      expect(endTagPosition!.start, equals(0));
      expect(endTagPosition.end, equals(6));
      expect(endTagPosition.tagName, equals('tag'));
    });

    test('findEndTag with tag at 5', () {
      const tagFinder = TagFinder('Some (/tag)text');
      final endTagPosition = tagFinder.findEndTag();

      expect(endTagPosition, isNotNull);
      expect(endTagPosition!.start, equals(5));
      expect(endTagPosition.end, equals(11));
      expect(endTagPosition.tagName, equals('tag'));
    });

    test('findEndTag with unmatched tag', () {
      const tagFinder = TagFinder('(/tag Some');
      final endTagPosition = tagFinder.findEndTag();

      expect(endTagPosition, isNull);
    });

    test('findEndTag with unmatched tag', () {
      const tagFinder = TagFinder('(/t2ag');
      final endTagPosition = tagFinder.findEndTag();

      expect(endTagPosition, isNull);
    });
  });
}
