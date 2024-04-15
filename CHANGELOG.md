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
