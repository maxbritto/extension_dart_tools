import 'dart:io';

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
}
