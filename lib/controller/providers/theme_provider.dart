import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:walkmate/model/constants/constants.dart';

class CustomThemes {
  final BuildContext context;

  CustomThemes(this.context);
  //-------------DARK THEME SETTINGS
  getDarkTheme() => ThemeData(
        scaffoldBackgroundColor: Kconstants.of(context)!.black,
      );

  //-------------light THEME SETTINGS
  getLightTheme() => ThemeData(
        scaffoldBackgroundColor: Kconstants.of(context)!.offWhite,
      );
}

class ThemeNotifier extends ChangeNotifier {
  //-----Store the theme of our app
  ThemeMode themeMode = ThemeMode.light;
  bool isOn = true; // set the value with the theme on or off.

  //----If theme mode is equal to dark then we return True
  //-----isDarkMode--is the field we will use in our switch
  bool get isDarkMode => themeMode == ThemeMode.dark;

  //---implement ToggleTheme function
  void toggleTheme() {
    isOn = !isOn;
    themeMode = isOn ? ThemeMode.light : ThemeMode.dark;

    notifyListeners();
  }
}

final themeProvider = ChangeNotifierProvider<ThemeNotifier>((ref) {
  return ThemeNotifier();
});
