import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:walkmate/controller/providers/theme_provider.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
    required this.ref,
    required this.iconColor,
    this.themeButton = "Theme.svg",
  });

  final WidgetRef ref;
  final Color iconColor;
  final String themeButton;

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
          child: SvgPicture.asset("assets/images/$themeButton"),
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
