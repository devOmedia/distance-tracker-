import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:walkmate/controller/providers/theme_provider.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
    required this.ref,
    required this.iconColor,
    this.isWhiteBackground = true,
  });

  final WidgetRef ref;
  final Color iconColor;

  final bool
      isWhiteBackground; // use this variable to handle the different theme icon

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        LogoWidget(
          iconColor: iconColor,
        ),
        GestureDetector(
          onTap: () {
            ref.read(themeProvider).toggleTheme();
          },
          child: isWhiteBackground
              ? SvgPicture.asset("assets/images/Theme.svg")
              : ref.watch(themeProvider).isDarkMode
                  ? SvgPicture.asset("assets/images/light_theme.svg")
                  : SvgPicture.asset("assets/images/dark_theme.svg"),
        )
      ],
    );
  }
}

class LogoWidget extends StatelessWidget {
  const LogoWidget({
    super.key,
    required this.iconColor,
  });

  final Color iconColor;

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
            color: iconColor),
      ),
    );
  }
}
