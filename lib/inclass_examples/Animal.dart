import 'package:flutter/material.dart';

class Animal {
  void sound () {
      print('Make a sound');
  }
}

class Horse extends Animal {
  void sound () {
    print('Neigh');
  }
  void ride() {
    print('Ride');
  }
}

class Cat extends Animal {
  void sound () {
    print('Meow');
  }
  void scratch() {
    print('Scratch');
  }
}