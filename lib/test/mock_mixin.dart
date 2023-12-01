import 'package:collection/collection.dart';

class MockNullValue {
  final bool isNUll = true;
  const MockNullValue();
}

/// Represents a method call with its name and optional arguments
/// arguments is a [Map] of the arguments passed to the method
class MethodCall {
  final String methodName;
  final Map<String, dynamic> arguments;
  MethodCall({required this.methodName, this.arguments = const {}});
}

mixin MockMixin {
  /// A list of all the method calls that were made to the mock
  /// Note: this list will be filled only if you use the method [addCall] and not if you use the method [addCalledFunction] (which only supports functions names)
  final List<MethodCall> methodCallList = [];
  final List<String> calledFunctions = [];
  final List<dynamic> _preparedObjects = [];
  final Map<String, dynamic> receivedObjects = {};
  dynamic _lastReceivedObject;
  set lastReceivedObject(dynamic object) {
    receivedObjects[object.toString()] = object;
    _lastReceivedObject = object;
  }

  dynamic get lastReceivedObject => _lastReceivedObject;

  addReceivedObject(dynamic object, {required String name}) {
    receivedObjects[name] = object;
    _lastReceivedObject = object;
  }

  /// Adds a method call to the list of method calls
  /// and adds the arguments to the list of received objects
  ///
  /// Note: this is the preferred method to use to add a method call as it also forwards the information to the other methods
  addCall({required String named, Map<String, dynamic> arguments = const {}}) {
    methodCallList.add(MethodCall(methodName: named, arguments: arguments));
    addCalledFunction(named: named);
    for (final argument in arguments.entries) {
      addReceivedObject(argument.value, name: argument.key);
    }
  }

  @pragma('You should use addCall instead')
  addCalledFunction({required String named}) {
    calledFunctions.add(named);
  }

  dynamic get nextReturnedObject {
    if (_preparedObjects.isEmpty) {
      return null;
    } else {
      return _preparedObjects[0];
    }
  }

  set nextReturnedObject(dynamic nextObject) {
    addNextReturnFutureObject(nextObject);
  }

  /// Returns all the [MethodCall] of a specific method
  /// each call will contain the method name and argument
  List<MethodCall> callsForMethod({required String named}) {
    return methodCallList
        .where((element) => element.methodName == named)
        .toList();
  }

  MethodCall? lastCallForMethod({required String named}) {
    return methodCallList
        .lastWhereOrNull((element) => element.methodName == named);
  }

  MethodCall? lastCall() {
    if (methodCallList.isEmpty) {
      return null;
    } else {
      return methodCallList.last;
    }
  }

  bool wasCalled({required String functionName}) {
    return calledFunctions.contains(functionName) ||
        methodCallList.any((element) => element.methodName == functionName);
  }

  bool wasCalledWithArguments(
      {required String functionName,
      Map<String, dynamic> arguments = const {}}) {
    return methodCallList.any((element) =>
        element.methodName == functionName &&
        const MapEquality().equals(element.arguments, arguments));
  }

  resetAllTestValues() {
    calledFunctions.clear();
    lastReceivedObject = null;
    _preparedObjects.clear();
    receivedObjects.clear();
  }

  ///Receives a regular object and save it for the next function that will need to return something
  addNextReturnFutureObject(dynamic object) {
    _preparedObjects.add(object ?? const MockNullValue());
  }

  dynamic popNextReturnedObject() {
    if (_preparedObjects.isEmpty) {
      return null;
    }
    final returnedObject = _preparedObjects.removeAt(0);
    if (returnedObject is MockNullValue) {
      //we store a basic Object to mock a null return
      return null;
    } else if (returnedObject is Error || returnedObject is Exception) {
      throw returnedObject;
    } else if (returnedObject is dynamic Function()) {
      return returnedObject();
    } else {
      return returnedObject;
    }
  }
}
