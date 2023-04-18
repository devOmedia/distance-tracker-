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
    final Kconst = Kconstants.of(context);
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children: [
          //top green portion
          Flexible(
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
                // ==================================>>  custom app bar
                CustomAppBar(
                  ref: ref,
                  iconColor: Kconstants.of(context)!.offWhite,
                  isWhiteBackground: false,
                ),
                //==================================>>
                SizedBox(height: size.height * 0.06),
                Text(
                  "Set Your Walking Goal Now!",
                  style: Kconstants.of(context)!.header.copyWith(
                        color: Kconstants.of(context)!.offWhite,
                        fontSize: size.width * 0.1,
                      ),
                ),
                //===============================>>
                SizedBox(height: size.height * 0.04),
                Text(
                  "Your determination and effort is inspiring. Keep pushing yourself to reach new heights.",
                  maxLines: 3,
                  style: Kconst!.subHeader.copyWith(
                    color: Kconst.offWhite,
                    wordSpacing: 1.5,
                    fontSize: size.width * 0.035,
                  ),
                ),
                SizedBox(height: size.height * 0.04),
              ],
            ),
          )),
          Expanded(
            child: Container(),
          ),
        ],
      ),
    );
  }
}
