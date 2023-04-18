import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:walkmate/controller/providers/theme_provider.dart';
import 'package:walkmate/model/constants/constants.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
    required this.ref,
  });

  final WidgetRef ref;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const LogoWidget(),
        GestureDetector(
          onTap: () {
            ref.read(themeProvider).toggleTheme();
          },
          child: SvgPicture.asset("assets/images/Theme.svg"),
        )
      ],
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
