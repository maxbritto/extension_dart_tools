extension StringValidations on String {
  bool get isValidEmail {
    return RegExp(
            r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?")
        .hasMatch(this);
  }

  bool get isValidURL {
    return RegExp(
            r"(https?|http)://([-A-Z0-9.]+)(/[-A-Z0-9+&@#/%=~_|!:,.;]*)?(\?[A-Z0-9+&@#/%=~_|!:‌​,.;]*)?",
            caseSensitive: false)
        .hasMatch(this);
  }

  bool get isValidHexColor {
    return RegExp(r"\#?[0-9a-fA-F]{6}").hasMatch(this);
  }

  /// Returns a version that removes every character that is not a letters and converts all letters to lowercase
  String get sanitizedVersion =>
      replaceAll(RegExp("[^A-Za-z]+"), "").toLowerCase();
}
