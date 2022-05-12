import 'package:extension_dart_tools/extension_tools.dart';
import 'package:test/test.dart';

main() {
  test('Test valid emails', () {
    expect("will@acn.com".isValidEmail, true);
    expect("will+tag@acn.com".isValidEmail, true);
    expect("will+tag@acn.co".isValidEmail, true);
    expect("will+tag@acn.".isValidEmail, false);
  });

  test('Test valid urls', () {
    expect("https://www.purplegiraffe.fr".isValidURL, true);
    expect("https://purplegiraffe.fr".isValidURL, true);
    expect("purplegiraffe.fr".isValidURL, false);
  });

  test('Valid Hex color', () {
    expect("#12ab34".isValidHexColor, true);
    expect("#12AB34".isValidHexColor, true);
    expect("12ab34".isValidHexColor, true);
    expect("12AB34".isValidHexColor, true);

    expect("12abzz".isValidHexColor, false,
        reason: "z is not a valid hex value");
    expect("2ab34".isValidHexColor, false);
    expect("2".isValidHexColor, false);
    expect("#22999".isValidHexColor, false, reason: "Not enough values");
  });

  test("Sanitized string", () {
    expect("Purple Giraffe".sanitizedVersion, "purplegiraffe");
    expect("Invest with Teri".sanitizedVersion, "investwithteri");
    expect("SoForme".sanitizedVersion, "soforme");
    expect("It's cool".sanitizedVersion, "itscool");
  });
}
