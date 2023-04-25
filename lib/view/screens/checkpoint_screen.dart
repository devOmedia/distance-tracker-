import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:walkmate/controller/providers/target_provider.dart';
import 'package:walkmate/controller/providers/theme_provider.dart';
import 'package:walkmate/model/constants/constants.dart';
import 'package:walkmate/view/widgets/custom_app_bar.dart';
import 'package:walkmate/view/widgets/custom_button.dart';
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
    final Kconst = Kconstants.of(context);
    final themePro = ref.watch(themeProvider);
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
                  SizedBox(height: size.height * 0.02),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      //====================================>>> slider
                      SliderVerticalWidget(size: size),
                      // ====================================>>> complete and target show widget
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            "Completed",
                            style: Kconstants.of(context)!.header.copyWith(
                                  color: Kconstants.of(context)!.offWhite,
                                  fontSize: size.width * 0.045,
                                ),
                          ),
                          Text(
                            "${ref.watch(targetProvider).completedLimit.round()} m",
                            style: Kconstants.of(context)!.subHeader.copyWith(
                                  color: Kconstants.of(context)!.white,
                                  fontSize: size.width * 0.08,
                                ),
                          ),
                          const SizedBox(height: 16),
                          Text(
                            "Target",
                            style: Kconstants.of(context)!.header.copyWith(
                                  color: Kconstants.of(context)!.offWhite,
                                  fontSize: size.width * 0.045,
                                ),
                          ),
                          Text(
                            "${ref.watch(targetProvider).target.round()} m",
                            style: Kconstants.of(context)!.subHeader.copyWith(
                                  color: Kconstants.of(context)!.white,
                                  fontSize: size.width * 0.08,
                                ),
                          )
                        ],
                      )
                    ],
                  ),
                  SizedBox(height: size.height * 0.02),
                ],
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: size.height * 0.04),
                  Text(
                    "Checkpoints".toUpperCase(),
                    style: Kconst!.subHeader.copyWith(
                      letterSpacing: 1.5,
                      color:
                          themePro.isDarkMode ? Kconst.offWhite : Kconst.black,
                    ),
                  ),
                  //========================================>>> checkpoint
                  SizedBox(height: size.height * 0.02),
                  CustomButtonWidget(
                    size: size,
                    onPressed: () {},
                    title: "Add Checkpoint",
                  ),
                  //=======================================>>> mark as completed button.
                  SizedBox(height: size.height * 0.02),
                  Container(
                    height: size.height * 0.08,
                    width: size.width - 32,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(32),
                      border: Border.all(color: Kconst.green),
                    ),
                    child: Center(
                      child: Text(
                        'Mark As Completed',
                        style: TextStyle(
                          letterSpacing: 1.5,
                          fontWeight: FontWeight.w600,
                          fontSize: size.width * 0.035,
                          color: themePro.isDarkMode
                              ? Kconst.offWhite
                              : Kconst.green,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
