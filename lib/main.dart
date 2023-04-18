import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:walkmate/model/constants/constants.dart';
import 'package:walkmate/view/screens/home_screens.dart';
import 'package:walkmate/view/screens/target_satter_screen.dart';

import 'controller/providers/theme_provider.dart';

void main() {
  runApp(
    const ProviderScope(
      child: Kconstants(
        child: MyApp(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    //initialize the theme class.
    final CustomThemes customThemes = CustomThemes(context);
    return Consumer(
      builder: (BuildContext context, WidgetRef ref, Widget? child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: customThemes.getLightTheme(),
          darkTheme: customThemes.getDarkTheme(),
          themeMode: ref.watch(themeProvider).themeMode,
          initialRoute: HomeScreens.id,
          routes: {
            HomeScreens.id: (context) => const HomeScreens(),
            TargetSatterScreen.id: (context) => const TargetSatterScreen(),
          },
        );
      },
    );
  }
}
