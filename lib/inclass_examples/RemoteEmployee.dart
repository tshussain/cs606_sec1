import 'Employee.dart';

class RemoteEmployee extends Employee {
  String _location;

  String get location => _location;

  set location(String value) {
    _location = value;
  }

  prettyPrint() {
    print(name + payRate.toString() + _location);
  }
}