import 'package:flutter/cupertino.dart';

class Employee {
  String _name;
  int _age;
  @protected
  double payRate;


  String get name => _name;

  set name(String value) {
    _name = value;
  }

  int get age => _age;

  set age(int value) {
    _age = value;
  }
}


class Boss2 {
  getEmployeeName(Employee employee) {
    return employee._name;
  }
}

class RemoteEmployee2 extends Employee {
  String _location;

  String get location => _location;

  set location(String value) {
    _location = value;
  }

  prettyPrint() {
    print(_name + payRate.toString() + _location);
  }
}