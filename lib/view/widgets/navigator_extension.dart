import 'package:flutter/material.dart';

extension NavigatorExtension on BuildContext {
  Future<dynamic> push(Widget page) async {
    Navigator.push(this, MaterialPageRoute(builder: (_) => page));
  }

  Future<dynamic> pushReplacement(Widget page) async {
    Navigator.pushReplacement(this, MaterialPageRoute(builder: (_) => page));
  }

  Future<void> pop([result]) async {
    Navigator.of(this).pop(result);
  }
}
