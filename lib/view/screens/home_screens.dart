import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:walkmate/controller/providers/theme_provider.dart';
import 'package:walkmate/model/constants/constants.dart';

class HomeScreens extends ConsumerStatefulWidget {
  const HomeScreens({super.key});
  static const id = "/homeScreens";

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeScreensState();
}

class _HomeScreensState extends ConsumerState<HomeScreens> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Row(
            children: [
              const LogoWidget(),
              SvgPicture.asset("assets/images/Theme.svg")
            ],
          )
        ],
      ),
    );
  }
}

class LogoWidget extends StatelessWidget {
  const LogoWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (BuildContext context, WidgetRef ref, Widget? child) => Text(
        "WalkMate",
        style: TextStyle(
          fontFamily: "PlusJakartaSans",
          fontSize: 24,
          fontWeight: FontWeight.w700,
          // change the color according to the theme.
          color: ref.watch(themeProvider).isDarkMode
              ? Kconstants.of(context)!.offWhite
              : Kconstants.of(context)!.green,
        ),
      ),
    );
  }
}
