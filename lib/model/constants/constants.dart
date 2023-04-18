import 'package:flutter/material.dart';

class Kconstants extends InheritedWidget {
  static Kconstants? of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<Kconstants>();

  const Kconstants({required Widget child, required Key key})
      : super(key: key, child: child);

  final String successMessage = 'Some message';
  final Color green = const Color(0xff20C56C);
  final Color black = const Color(0xff191A1B);
  final Color grey = const Color(0xff9FA1A3);
  final Color offWhite = const Color(0xffEDF1F5);
  final Color lightBlack = const Color(0xffEDF1F5);
  final Color white = const Color(0XFFFFFFFF);

  @override
  bool updateShouldNotify(Kconstants oldWidget) => false;
}
