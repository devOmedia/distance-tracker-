import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TargetNotifier extends ChangeNotifier {
  double target = 100;
  final List<double> checkPoints = [];
  double completedLimit = 0;
  double limit = 0;

//set target
  setTarget(double value) {
    target = value;
   // notifyListeners();
  }

  setLimit(double value) {
    limit = value;
    notifyListeners();
  }

//add checkpoint values.
  addCheckPint(double value) {
    checkPoints.add(value);
//calculate the total limit.s
    if (checkPoints.isNotEmpty) {
      for (int i = 0; i < checkPoints.length; i++) {
        completedLimit = checkPoints[i];
      }
    }
    notifyListeners();
  }

//reset the value.
  resetNotifier() {
    target = 0;
    checkPoints.clear();
  }
}

final targetProvider = ChangeNotifierProvider<TargetNotifier>((ref) {
  return TargetNotifier();
});
