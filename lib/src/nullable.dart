/// A class that represents a nullable value
/// It is used to wrap a value that can be null
/// and provide a way to handle null values in a type-safe way
/// Example in copyWith:
/// ```
/// class Person {
///   final String name;
///   final int? age;
///
///   Person({required this.name, this.age});
///
///   Person copyWith({String? name, Nullable<int>? age}) {
///     return Person(name: name ?? this.name, age: age?.value ?? this.age);
///   }
/// }
///
/// final person = Person(name: "John", age: 30);
/// final personWithUnmodifiedAge = person.copyWith(age: null);
/// print(personWithUnmodifiedAge.age); // 30
/// final personWithModifiedAge = person.copyWith(age: Nullable(value: 40));
/// print(personWithModifiedAge.age); // 40
/// final personWithNullifiedAge = person.copyWith(age: Nullable(value: null));
/// print(personWithNullifiedAge.age); // null
/// ```
class Nullable<T> {
  final T? value;

  Nullable({required this.value});
}
