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
    expect("https://purple giraffe.fr".isValidURL, false);
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

  test("Sanitized filename string", () {
    expect("valid_filename.txt".sanitizedFilenameVersion, "valid_filename.txt");
    expect("filename with spaces.txt".sanitizedFilenameVersion,
        "filename_with_spaces.txt",
        reason: "Spaces are replaced by _");
    expect(
        "filename with!spaces+and*special'chars.txt".sanitizedFilenameVersion,
        "filename_with_spaces_and_special_chars.txt",
        reason: "Special chars are replaced by _");
    expect("filename-with-dashes.pages".sanitizedFilenameVersion,
        "filename-with-dashes.pages",
        reason: "Dashes are allowed");
    expect("filename.with.dots.pages".sanitizedFilenameVersion,
        "filename.with.dots.pages",
        reason: "Dots are allowed");
    expect("filename.with.dots.and-dashes.pages".sanitizedFilenameVersion,
        "filename.with.dots.and-dashes.pages",
        reason: "Dots and dashes are allowed");
    expect(
        "filename.with.dots.and-dashes.and_underscores.pages"
            .sanitizedFilenameVersion,
        "filename.with.dots.and-dashes.and_underscores.pages",
        reason: "Dots, dashes and underscores are allowed");
    expect("filename-with-numbers12.mp4".sanitizedFilenameVersion,
        "filename-with-numbers12.mp4",
        reason: "Numbers are allowed");
  });

  test("pathFilename", () {
    expect("file:///path/to/file.txt".pathFilename, "file.txt");
    expect("/path/to/file.txt".pathFilename, "file.txt");
    expect("/path/to/file".pathFilename, "file");
    expect("file.txt".pathFilename, "file.txt");
    expect("file".pathFilename, "file");
    expect("".pathFilename, "");
  });

  test("renameFileInPath", () {
    expect("file:///path/to/file.txt".renameFileInPath("newfile.txt"),
        "file:///path/to/newfile.txt");
    expect("/path/to/file.txt".renameFileInPath("newfile.txt"),
        "/path/to/newfile.txt");
    expect("/path/to/file".renameFileInPath("newfile.txt"),
        "/path/to/newfile.txt");
    expect("file.txt".renameFileInPath("newfile.txt"), "newfile.txt");
    expect("file".renameFileInPath("newfile.txt"), "newfile.txt");
    expect("".renameFileInPath("newfile.txt"), "newfile.txt");
  });

  test("stripHtmlTags", () {
    expect("Without html".stripHtmlTags(), "Without html");
    expect("<p>With html</p>".stripHtmlTags(), "With html");
    expect("<p>With html</p><p>And another</p>".stripHtmlTags(),
        "With htmlAnd another");
    expect(
        '<a href="https://acn.com">With html and paramters</a>'.stripHtmlTags(),
        "With html and paramters");
  });
}
