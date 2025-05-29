import 'package:extension_dart_tools/src/date_time_extensions.dart';
import 'package:test/test.dart';

void main() {
  group("DateTime extensions", () {
    test("next day of week", () {
      var aMonday = DateTime(2022, 02, 21); //monday
      expect(aMonday.next(DateTime.tuesday), DateTime(2022, 02, 22));
      expect(aMonday.next(DateTime.wednesday), DateTime(2022, 02, 23));
      expect(aMonday.next(DateTime.thursday), DateTime(2022, 02, 24));
      expect(aMonday.next(DateTime.friday), DateTime(2022, 02, 25));
      expect(aMonday.next(DateTime.saturday), DateTime(2022, 02, 26));
      expect(aMonday.next(DateTime.sunday), DateTime(2022, 02, 27));
      expect(aMonday.next(DateTime.monday), DateTime(2022, 02, 28));
    });

    test("next day of week after the weekend", () {
      var aTuesday = DateTime(2022, 02, 22); //tuesday
      expect(aTuesday.next(DateTime.monday), DateTime(2022, 02, 28));
      expect(aTuesday.next(DateTime.tuesday), DateTime(2022, 02, 29));
    });
  });
}
