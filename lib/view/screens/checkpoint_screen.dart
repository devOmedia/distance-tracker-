import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:walkmate/model/constants/constants.dart';
import 'package:walkmate/view/widgets/custom_app_bar.dart';
import 'package:walkmate/view/widgets/sliderVerticalWidget.dart';

class CheckPointScreen extends ConsumerStatefulWidget {
  const CheckPointScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _CheckPointScreenState();
}

class _CheckPointScreenState extends ConsumerState<CheckPointScreen> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children: [
          Flexible(
            child: Container(
              padding: Kconstants.of(context)!.appPadding,
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
                  Row(
                    children: [
                      //====================================>>> slider
                      SliderVerticalWidget(size: size),
                    ],
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(),
          ),
        ],
      ),
    );
  }
}
