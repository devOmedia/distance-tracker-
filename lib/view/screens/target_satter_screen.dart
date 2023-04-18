import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:walkmate/model/constants/constants.dart';
import 'package:walkmate/view/widgets/custom_app_bar.dart';

class TargetSatterScreen extends ConsumerStatefulWidget {
  const TargetSatterScreen({super.key});
  static const id = "/targetSatterScreen";

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _TargetSatterScreenState();
}

class _TargetSatterScreenState extends ConsumerState<TargetSatterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          //top green portion
          Expanded(
              child: Container(
            padding: Kconstants.of(context)!.appPading,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(24),
                bottomRight: Radius.circular(24),
              ),
              color: Kconstants.of(context)!.green,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CustomAppBar(
                  ref: ref,
                  iconColor: Kconstants.of(context)!.offWhite,
                  themeButton: "dark_theme.svg",
                ),
              ],
            ),
          )),
          Expanded(child: Container()),
        ],
      ),
    );
  }
}
