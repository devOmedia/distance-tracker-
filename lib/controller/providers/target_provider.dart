import 'package:flutter/material.dart';

class TargetNotifier extends ChangeNotifier {
  int target = 0;
  final List<int> checkPoints = [];

//set target
  setTarget(int value) {
    target = value;
    notifyListeners();
  }

//add checkpoint values.
  addCheckPint(int value) {
    checkPoints.add(value);
    notifyListeners();
  }

//reset the value.
  resetNotifier() {
    target = 0;
    checkPoints.clear();
  }
}
