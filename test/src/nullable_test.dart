import 'package:extension_dart_tools/src/nullable.dart';
import 'package:test/test.dart';

class Person {
  final String name;
  final int? age;

  Person({required this.name, this.age});

  Person copyWith({String? name, Nullable<int>? age}) {
    return Person(
        name: name ?? this.name, age: age == null ? this.age : age.value);
  }
}

void main() {
  test('Nullable tests', () async {
    final person = Person(name: "John", age: 30);
    final personWithName = person.copyWith(name: "Jane");
    expect(personWithName.name, "Jane");
    expect(personWithName.age, 30);
    final personWithModifiedAge = person.copyWith(age: Nullable(value: 40));
    expect(personWithModifiedAge.age, 40);
    final personWithNullifiedAge =
        person.copyWith(age: Nullable<int>(value: null));
    expect(personWithNullifiedAge.age, null);
  });
}
