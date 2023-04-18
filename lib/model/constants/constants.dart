import 'package:flutter/material.dart';

class Kconstants extends InheritedWidget {
  static Kconstants? of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<Kconstants>();

  const Kconstants({Key? key, required Widget child})
      : super(key: key, child: child);

  final String successMessage = 'Some message';
  final Color green = const Color(0xff20C56C);
  final Color black = const Color(0xff191A1B);
  final Color grey = const Color(0xff9FA1A3);
  final Color offWhite = const Color(0xffEDF1F5);
  final Color lightBlack = const Color(0xffEDF1F5);
  final Color white = const Color(0XFFFFFFFF);

  //========================================>> text style
  final TextStyle header = const TextStyle(
    fontFamily: "PlusJakartaSans",
    fontWeight: FontWeight.w700,
  );

  final TextStyle subHeader = const TextStyle(
    fontFamily: "Manrope",
    fontWeight: FontWeight.w600,
  );

  final EdgeInsetsGeometry appPading =
      const EdgeInsets.only(top: 52, left: 24, right: 24);

  @override
  bool updateShouldNotify(Kconstants oldWidget) => false;
}
