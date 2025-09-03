## 1.4.1

- Added `Nullable` class to the exported classes.

## 1.4.0

- Added `Nullable` class to handle nullable values.

## 1.3.1

- Fixed a bug in the `MockMixin` class. The `resetAllTestValues` method was not resetting the new generation method call list.
- Fixed warnings with latest dart linter version.

## 1.3.0

### DateTime extensions

- Added `isSameDay` extension to `DateTime` class. It checks if two `DateTime` instances are in the same day, ignoring the time.

## 1.2.0

### String extensions

- Added `isValidPhoneNumber` extension to `String` class. Pretty basic since it just removes all allowed special characters +, (, ), -, dots and spaces and checks if the remaining characters are only digits. 

## 1.1.0

### MockMixin

- moved internally inside the test folder
- added a new class named `MethodCall` to represent a method call with its name and arguments
- added more functions to add method calls and to check existing method calls
- this new api also forward the information to the previous api with call names and arguments
- this new one is recommended as is can handle multiple calls of the same method with different arguments, which the previous method can't

## 1.0.0

- Initial version.
