import 'dart:io';

import 'package:html/parser.dart';

extension StringValidations on String {
  bool get isValidEmail {
    return RegExp(
            r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?")
        .hasMatch(this);
  }

  bool get isValidURL {
    return RegExp(
            r"^(?:http(s)?:\/\/)[\w.-]+(?:\.[\w\.-]+)+[\w\-\._~:/?#[\]@!\$&'\(\)\*\+,;=.]+",
            caseSensitive: false)
        .hasMatch(this);
  }

  bool get isValidHexColor {
    return RegExp(r"\#?[0-9a-fA-F]{6}").hasMatch(this);
  }

  /// Returns a version that removes every character that is not a letters and converts all letters to lowercase
  String get sanitizedVersion =>
      replaceAll(RegExp("[^A-Za-z]+"), "").toLowerCase();

  /// Returns a version that removes every character that is not a letters and converts all letters to lowercase
  String get sanitizedFilenameVersion =>
      replaceAll(RegExp("[^A-Za-z0-9.-]+"), "_").toLowerCase();

  String get pathFilename {
    return substring(lastIndexOf("/") + 1);
  }

  String renameFileInPath(String newName) {
    return substring(0, lastIndexOf(Platform.pathSeparator) + 1) + newName;
  }

  /// Returns a version that removes any HTML tags and only keeps the text
  String stripHtmlTags() {
    final document = parse(this);
    final body = document.body;
    if (body != null) {
      return parse(body.text).documentElement?.text ?? "";
    } else {
      return "";
    }
  }

  String addHtmlMetaViewPortTag(String metaTag) {
    final RegExp metaTagRegExp = RegExp(r'<meta name="viewport.*?>');
    const metaTag =
        '<meta name="viewport" content="width=device-width, initial-scale=1">';
    var toInsert = metaTag;
    if (metaTagRegExp.hasMatch(this)) {
      return replaceAll(metaTagRegExp, metaTag);
    } else {
      // Add the <head> block to the string if it is not present and the <meta> tag is not present
      const headTag = '<head>';
      final int headIndex = indexOf(headTag);
      if (headIndex >= 0) {
        final insertIndex = headIndex + headTag.length;
        return replaceRange(insertIndex, insertIndex, toInsert);
      } else {
        toInsert = '<head>$toInsert</head>';
        const bodyTag = '<body>';
        final int bodyIndex = indexOf(bodyTag);
        if (bodyIndex >= 0) {
          return replaceRange(bodyIndex, bodyIndex, toInsert);
        } else {
          return '<!DOCTYPE html><html>$toInsert<body>$this</body></html>';
        }
      }
    }
  }
}
